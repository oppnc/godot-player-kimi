extends Node
## Kimi Pilot v2.1 —— 回合制游玩装置（PLAY.md v0.2）
##
## 游戏启动后热身（0.5s 等效帧数），随后进入常态暂停。
## 轮询 .kimi-play/in/move.json（动作块/命令），注入执行、推进块长、再暂停，
## 并落盘观察包 .kimi-play/out/obs.json。全程 PNG 序列 MovieWriter 录像（由启动命令行指定）。
##
## 动作块 schema v2：
##   {"moves":[{"hold":"ui_right","frames":90},     # 按住 90 帧（推进游标）
##             {"tap":"ui_up"},                      # 点按（不推进游标；帧长按 tps/fps 标定）
##             {"wait":20},                          # 空等 20 帧（推进游标）
##             {"at":10,"action":"ui_left","pressed":true},  # 原始相对帧事件
##             {"at":5,"look":[120,0]},            # 鼠标相对运动（FPS/沙盒转视角，dx>0 右转 dy>0 下移）
##             {"at":0,"event":{"type":"joypad_motion","axis":0,"axis_value":-1.0}}],  # 通用原始事件（封闭类兜底）
##    "speed":4}                                     # 可选：本块局内执行倍速 0.1–10（默认 1）
## 通用事件 type 覆盖全部对局相关输入类：key / mouse_button / mouse_motion / joypad_button /
## joypad_motion / action / screen_touch / screen_drag / magnify_gesture / pan_gesture。
## 不覆盖 InputEventMIDI（音乐设备）与 InputEventShortcut（菜单快捷键匹配）——与玩游戏无关，
## 真需要时用 call 兜底通道直达业务逻辑。
## 命令（任何状态下可发）：
##   {"command":"quit"}    结束进程
##   {"command":"manual"}  真人接管（块执行中发它会立即打断）：解暂停、照录遥测与输入
##   {"command":"auto"}    交还 AI：回到回合制暂停
## 可选配置 .kimi-play/project.json：
##   {"player_path":"/root/Main", "watch":["pos:x","pos:y"], "input_actions":["ui_right","ui_up"]}
##
## 全程输入磁带：out/input_history.jsonl 记录本进程内全部输入事件（AI 注入 src=ai / 真人 src=human），
## 是「后悔/重开」的原料：quit → 重开 → 把磁带滤成大 at 块重放到目标帧 → 继续回合制。
##
## 物理帧 ↔ PNG 序号映射：暂停期 PNG 持续重复落盘，二者无固定比率；
## 每段运行区间记录于 out/framemap.jsonl（{"f0","p0","f1"}），区间内按 movie_fps/tps 线性换算。
## 磁盘防护：暂停期重复帧定期裁剪（只留最新一小窗），锚点与历史段不受影响。

const VERSION := "2.1"
const DIR := "res://.kimi-play"
const IN_DIR := DIR + "/in"
const OUT_DIR := DIR + "/out"
const FRAMES_DIR := OUT_DIR + "/frames"
const MOVE_FILE := IN_DIR + "/move.json"
const HEARTBEAT_FILE := IN_DIR + "/heartbeat"
const OBS_FILE := OUT_DIR + "/obs.json"
const STATE_FILE := OUT_DIR + "/state.json"
const TELEMETRY_FILE := OUT_DIR + "/telemetry.jsonl"
const FRAMEMAP_FILE := OUT_DIR + "/framemap.jsonl"
const CONFIG_FILE := DIR + "/project.json"
const INPUT_HISTORY_FILE := OUT_DIR + "/input_history.jsonl"
const HEARTBEAT_TIMEOUT_S := 1800.0
const PRUNE_INTERVAL_S := 5.0
const PRUNE_LAG_MARGIN := 90    # 暂停开始时预留的编码器滞后余量（帧序号）
const PRUNE_KEEP_RECENT := 30   # 裁剪时保留的最新重复帧数

var frame := 0
var turn := 0
var tps := 60
var movie_fps := 30
var warmup_frames := 30     # _ready 按 tps 标定（0.5s）
var tap_frames := 4         # _ready 按 tps/movie_fps 标定（跨输入冲刷周期）
var tele: FileAccess
var history: FileAccess
var hud: Label
var watch_root: Node = null
var player_path := ""      # 延迟解析：场景切换型游戏开局时目标可能还不存在
var watch: Array = []
var schedule: Array = []          # [{"f":int,"action":String,"pressed":bool}]，绝对帧号
var pressed_by_pilot := {}        # pilot 注入且尚未松开的动作（防跨块/打断卡键）
var block_end := -1               # 当前块结束的绝对帧号；-1 = 无在执行块
var warmup_done := false
var run_start_f := 0              # 当前运行区间的起始物理帧
var run_start_png := 0            # 当前运行区间的起始 PNG 序号
var last_status := ""             # 最近一次 obs 的 status（暂停期定时刷新用）
var last_hint := ""
var obs_refresh := 0.0
var prune_floor := -1             # >=0 时暂停期裁剪该序号以上的旧重复帧
var prune_timer := 0.0
var capture_pending := -1         # >=0 时倒数若干空闲帧后把最新帧钉存为 out/current.png
var manual_mode := false          # 真人接管中：不暂停、不消费块结束、照录遥测与输入
var input_actions: Array = []     # manual 态要录制的动作（project.json 配置）
var prev_states := {}


func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	tps = Engine.physics_ticks_per_second
	var args := OS.get_cmdline_args()
	for i in args.size():
		if args[i] == "--fixed-fps" and i + 1 < args.size():
			movie_fps = int(args[i + 1])
	# 帧率无关的标定：热身 0.5s；tap 覆盖两个输入冲刷周期（电影帧 = tps/movie_fps 物理帧）
	warmup_frames = maxi(30, int(tps * 0.5))
	tap_frames = maxi(4, 2 * int(ceil(float(tps) / float(movie_fps))) + 2)
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(IN_DIR))
	DirAccess.make_dir_recursive_absolute(ProjectSettings.globalize_path(OUT_DIR))
	tele = FileAccess.open(TELEMETRY_FILE, FileAccess.WRITE)
	history = FileAccess.open(INPUT_HISTORY_FILE, FileAccess.WRITE)  # 每进程一卷新磁带
	_load_config()
	_make_hud()
	_write_state("warmup")
	print("PILOT v%s ready, tps=%d movie_fps=%d warmup=%d tap=%d" % [VERSION, tps, movie_fps, warmup_frames, tap_frames])


func _load_config() -> void:
	var f := FileAccess.open(CONFIG_FILE, FileAccess.READ)
	if f == null:
		return
	var cfg = JSON.parse_string(f.get_as_text())
	if typeof(cfg) != TYPE_DICTIONARY:
		return
	if cfg.has("watch"):
		watch = cfg["watch"]
	if cfg.has("input_actions"):
		input_actions = cfg["input_actions"]
		for a in input_actions:
			prev_states[str(a)] = false
	if cfg.has("player_path"):
		player_path = str(cfg["player_path"])
		watch_root = get_node_or_null(player_path)


func _make_hud() -> void:
	var layer := CanvasLayer.new()
	layer.layer = 128
	hud = Label.new()
	hud.position = Vector2(8, 8)
	layer.add_child(hud)
	get_tree().root.call_deferred("add_child", layer)


func _physics_process(_delta: float) -> void:
	if get_tree().paused:
		return
	for e in schedule:
		if e["f"] == frame:
			if e.has("button"):
				_inject_mouse(e)
			elif e.has("look"):
				_inject_look(e["look"])
			elif e.has("key"):
				_inject_key(e["key"], e["pressed"])
			elif e.has("event"):
				_inject_event(e["event"])
			elif e.has("call"):
				_inject_call(e)
			else:
				_inject(e["action"], e["pressed"])
	_write_telemetry()
	if manual_mode:
		_log_human_inputs()
	frame += 1
	if manual_mode:
		return  # 真人接管：无块结束概念
	if block_end >= 0 and frame >= block_end:
		# 冲刷未发事件（理论上 block_end = 最远事件帧+1，此处为保险），再暂停
		for e in schedule:
			if int(e["f"]) >= frame:
				_inject(e["action"], e["pressed"])
		block_end = -1
		_pause_turn()
	elif not warmup_done and frame >= warmup_frames:
		warmup_done = true
		_pause_turn()


## manual 态逐帧录制真人动作状态跳变（与 AI 注入同一卷磁带，src=human）
func _log_human_inputs() -> void:
	for a in input_actions:
		var st := Input.is_action_pressed(str(a))
		if st != prev_states[str(a)]:
			prev_states[str(a)] = st
			_log_input(str(a), st, "human")


func _process(delta: float) -> void:
	if is_instance_valid(hud):
		var st := "PAUSED" if get_tree().paused else ("MANUAL" if manual_mode else "RUN")
		hud.text = "f=%d  %s  turn=%d" % [frame, st, turn]
	if get_tree().paused:
		# 等编码器冲刷后把最新帧钉存为 current.png：暂停期地址稳定、不随裁剪消失
		if capture_pending > 0:
			capture_pending -= 1
			if capture_pending == 0:
				_pin_current_frame()
		# 暂停期定时刷新 obs
		if last_status != "":
			obs_refresh += delta
			if obs_refresh >= 1.0:
				obs_refresh = 0.0
				_write_obs(last_status, last_hint)
		prune_timer += delta
		if prune_timer >= PRUNE_INTERVAL_S:
			prune_timer = 0.0
			_prune_frames()
	_check_heartbeat()
	# 任何状态都消费指令（manual/quit 可以在块执行中打断；moves 只在暂停时受理）
	if FileAccess.file_exists(MOVE_FILE):
		_consume_move()


## 暂停期重复帧裁剪：删除 [prune_floor, 最新-PRUNE_KEEP_RECENT] 区间内的 PNG
func _prune_frames() -> void:
	if prune_floor < 0:
		return
	var idx_max := _max_png_index()
	var keep_above := idx_max - PRUNE_KEEP_RECENT
	if keep_above < prune_floor:
		return
	var d := DirAccess.open(ProjectSettings.globalize_path(FRAMES_DIR))
	if d == null:
		return
	var deleted := 0
	d.list_dir_begin()
	var name := d.get_next()
	while name != "":
		if name.begins_with("movie") and name.ends_with(".png"):
			var n := name.trim_prefix("movie").trim_suffix(".png").to_int()
			if n >= prune_floor and n <= keep_above:
				DirAccess.remove_absolute(ProjectSettings.globalize_path(FRAMES_DIR + "/" + name))
				deleted += 1
		name = d.get_next()
	d.list_dir_end()
	if deleted > 0:
		print("PILOT pruned %d dup frames (f=%d)" % [deleted, frame])


func _inject(action: String, pressed: bool) -> void:
	var ev := InputEventAction.new()
	ev.action = action
	ev.pressed = pressed
	Input.parse_input_event(ev)
	pressed_by_pilot[action] = pressed
	_log_input(action, pressed, "ai")


func _inject_mouse(e: Dictionary) -> void:
	var pos := Vector2(e["pos"][0], e["pos"][1])
	if e["pressed"]:
		# 先送一次悬停位移，某些 UI 需要 hover 后才接受点击
		var motion := InputEventMouseMotion.new()
		motion.position = pos
		motion.global_position = pos
		Input.parse_input_event(motion)
	var ev := InputEventMouseButton.new()
	ev.button_index = e["button"]
	ev.position = pos
	ev.global_position = pos
	ev.pressed = e["pressed"]
	Input.parse_input_event(ev)
	_log_input("click:%d,%d" % [int(pos.x), int(pos.y)], e["pressed"], "ai")


## FPS/沙盒转视角：相对位移注入（MOUSE_MODE_CAPTURED 下游戏只读 relative）
func _inject_look(rel: Array) -> void:
	var ev := InputEventMouseMotion.new()
	ev.relative = Vector2(rel[0], rel[1])
	_log_input("look:%d,%d" % [int(rel[0]), int(rel[1])], true, "ai")
	Input.parse_input_event(ev)


## 通用原始事件：Godot 输入事件是封闭类，此通道一次覆盖全部成员。
## type: key / mouse_button / mouse_motion / joypad_button / joypad_motion / action / screen_touch / screen_drag
## 字段用引擎原生属性名（pressed/button_index/axis/axis_value/relative/position/strength...）；
## 便捷转换：key 事件的 keycode/physical_keycode 接受键名串，[x,y] 数组自动转 Vector2。
func _make_event(spec: Dictionary) -> InputEvent:
	var ev: InputEvent = null
	match str(spec.get("type", "")):
		"key": ev = InputEventKey.new()
		"mouse_button": ev = InputEventMouseButton.new()
		"mouse_motion": ev = InputEventMouseMotion.new()
		"joypad_button": ev = InputEventJoypadButton.new()
		"joypad_motion": ev = InputEventJoypadMotion.new()
		"action": ev = InputEventAction.new()
		"screen_touch": ev = InputEventScreenTouch.new()
		"screen_drag": ev = InputEventScreenDrag.new()
		"magnify_gesture": ev = InputEventMagnifyGesture.new()  # 触控板捏合缩放
		"pan_gesture": ev = InputEventPanGesture.new()          # 触控板双指平移
	if ev == null:
		return null
	for k in spec:
		if k == "type":
			continue
		var v = spec[k]
		if ev is InputEventKey and (k == "keycode" or k == "physical_keycode") and v is String:
			v = OS.find_keycode_from_string(v)
		elif v is Array and v.size() == 2:
			v = Vector2(v[0], v[1])
		ev.set(k, v)
	# 键事件补双写（同真实键盘），游戏绑 keycode 还是 physical 都能命中
	if ev is InputEventKey:
		var kev := ev as InputEventKey
		if kev.keycode == KEY_NONE and kev.physical_keycode != KEY_NONE:
			kev.keycode = kev.physical_keycode
		elif kev.physical_keycode == KEY_NONE and kev.keycode != KEY_NONE:
			kev.physical_keycode = kev.keycode
	return ev


func _inject_event(spec: Dictionary) -> void:
	var ev := _make_event(spec)
	if ev == null:
		push_warning("PILOT unknown event type: %s" % spec.get("type", ""))
		return
	_log_input("event:%s" % spec.get("type", "?"), bool(spec.get("pressed", true)), "ai")
	Input.parse_input_event(ev)


## 兜底通道：直接调用任意节点方法（顽固 UI / 直接触发业务逻辑）
func _inject_call(e: Dictionary) -> void:
	var node := get_node_or_null(NodePath(e["call"]))
	if node == null:
		push_warning("PILOT call target not found: %s" % e["call"])
		return
	node.callv(e["method"], e.get("args", []))
	_log_input("call:%s.%s" % [e["call"], e["method"]], true, "ai")


func _inject_key(kname: String, pressed: bool) -> void:
	var code := OS.find_keycode_from_string(kname)
	if code == KEY_NONE:
		push_warning("PILOT unknown key name: %s" % kname)
		return
	var ev := InputEventKey.new()
	# 真键盘事件 keycode/physical_keycode 双写；游戏绑定哪一种都能命中
	ev.keycode = code
	ev.physical_keycode = code
	ev.pressed = pressed
	Input.parse_input_event(ev)
	_log_input("key:" + kname, pressed, "ai")


## manual 态捕获真人物理按键（event 路线游戏的操作磁带）
func _unhandled_input(event: InputEvent) -> void:
	if not manual_mode:
		return
	if event is InputEventKey and not event.is_echo():
		_log_input("key:" + OS.get_keycode_string(event.keycode), event.pressed, "human")


func _log_input(action: String, pressed: bool, src: String) -> void:
	if history == null:
		return
	history.store_line(JSON.stringify({"f": frame, "action": action, "pressed": pressed, "src": src}))
	history.flush()


## 强制松开所有 pilot 注入的按压（打断/交接时防卡键）
func _release_all() -> void:
	for a in pressed_by_pilot.keys():
		if pressed_by_pilot[a]:
			_inject(str(a), false)


func _consume_move() -> void:
	var f := FileAccess.open(MOVE_FILE, FileAccess.READ)
	if f == null:
		return
	var text := f.get_as_text()
	f.close()
	var data = JSON.parse_string(text)
	if typeof(data) != TYPE_DICTIONARY:
		# 可能读到写了一半的文件：改名隔离并报错，不反复重试
		DirAccess.rename_absolute(
			ProjectSettings.globalize_path(MOVE_FILE),
			ProjectSettings.globalize_path(MOVE_FILE + ".bad"))
		_write_obs("error", "move.json 不是合法 JSON 对象；已隔离为 move.json.bad。检查写入是否原子（先写 .tmp 再改名）。")
		return
	DirAccess.remove_absolute(ProjectSettings.globalize_path(MOVE_FILE))
	var cmd := str(data.get("command", ""))
	if cmd == "quit":
		print("PILOT quit command at f=%d turn=%d" % [frame, turn])
		get_tree().quit()
		return
	if cmd == "manual":
		# 真人接管（可打断执行中的块）：恢复常速、松键清调度、解除暂停
		manual_mode = true
		block_end = -1
		Engine.time_scale = 1.0
		_release_all()
		schedule.clear()
		for a in prev_states.keys():
			prev_states[a] = false
		prune_floor = -1
		run_start_f = frame
		run_start_png = _max_png_index() + 1
		get_tree().paused = false
		_write_state("manual")
		print("PILOT manual mode at f=%d" % frame)
		return
	if cmd == "ui_dump":
		# UI 内省：导出当前可见按钮清单（text/路径/全局矩形）到 out/ui.json
		_ui_dump()
		return
	if cmd == "auto":
		# 交还 AI（manual 态或块执行中均可）：恢复常速、松键、回到回合制暂停
		manual_mode = false
		block_end = -1
		Engine.time_scale = 1.0
		_release_all()
		schedule.clear()
		_pause_turn()
		return
	if manual_mode:
		_write_state("manual")  # manual 态收到的 moves 一律忽略
		print("PILOT ignoring moves while manual (f=%d)" % frame)
		return
	if get_tree().paused == false:
		_write_obs("error", "块执行中，moves 不受理；等暂停，或先发 {\"command\":\"manual\"} 接管。")
		return
	var moves: Array = data.get("moves", [])
	if moves.is_empty():
		_write_obs("error", "move.json 缺少 moves（或 command）。例：{\"moves\":[{\"hold\":\"ui_right\",\"frames\":90}]}")
		return
	var err := _build_schedule(moves)
	if err != "":
		_write_obs("error", err)
		return
	# 局内执行倍速：0.1–10，块结束/被接管时自动恢复 1.0
	Engine.time_scale = clampf(float(data.get("speed", 1.0)), 0.1, 10.0)
	prune_floor = -1
	run_start_f = frame
	run_start_png = _max_png_index() + 1
	get_tree().paused = false
	_write_state("running")


## 把动作块编译成绝对帧事件表；返回错误串（空串 = 成功）
func _build_schedule(moves: Array) -> String:
	schedule.clear()
	var cursor := frame
	var max_event_f := -1  # 所有事件的最远绝对帧号
	for i in moves.size():
		var m = moves[i]
		if typeof(m) != TYPE_DICTIONARY:
			return "moves[%d] 不是对象" % i
		if m.has("at") and m.has("click"):
			# UI 点击：{"at":10,"click":[x,y]}，坐标为视口坐标（obs.viewport 有尺寸，与截图像素对比换算）
			# 可选 "button":1/2/3/4/5（默认左键；2=右键放方块，4/5=滚轮）
			var pos: Array = m["click"]
			var btn := int(m.get("button", MOUSE_BUTTON_LEFT))
			schedule.append({"f": frame + int(m["at"]), "button": btn, "pos": pos, "pressed": true})
			schedule.append({"f": frame + int(m["at"]) + tap_frames, "button": btn, "pos": pos, "pressed": false})
		elif m.has("at") and m.has("key"):
			# 物理按键：{"at":10,"key":"up"} 点按；{"at":10,"key":"up","pressed":true} 单边沿
			# 适配 _unhandled_input(event is InputEventKey) 路线的游戏
			var kname := str(m["key"])
			if m.has("pressed"):
				schedule.append({"f": frame + int(m["at"]), "key": kname, "pressed": bool(m["pressed"])})
			else:
				schedule.append({"f": frame + int(m["at"]), "key": kname, "pressed": true})
				schedule.append({"f": frame + int(m["at"]) + tap_frames, "key": kname, "pressed": false})
		elif m.has("at") and m.has("look"):
			# 鼠标相对运动（FPS 转视角）：{"at":5,"look":[dx,dy]}，dx>0 右转，dy>0 下移
			schedule.append({"f": frame + int(m["at"]), "look": m["look"]})
		elif m.has("at") and m.has("event"):
			# 通用原始事件（兜底，覆盖 Godot 输入事件封闭类的全部成员）：
			# {"at":0,"event":{"type":"joypad_motion","axis":0,"axis_value":-1.0}}
			schedule.append({"f": frame + int(m["at"]), "event": m["event"]})
		elif m.has("at") and m.has("action"):
			schedule.append({"f": frame + int(m["at"]), "action": str(m["action"]), "pressed": bool(m.get("pressed", true))})
		elif m.has("at") and m.has("call"):
			# 兜底：直接调节点方法。{"at":0,"call":"/root/SceneRouter","method":"start_run","args":[]}
			schedule.append({"f": frame + int(m["at"]), "call": str(m["call"]), "method": str(m.get("method", "")), "args": m.get("args", [])})
		elif m.has("tap"):
			schedule.append({"f": cursor, "action": str(m["tap"]), "pressed": true})
			schedule.append({"f": cursor + tap_frames, "action": str(m["tap"]), "pressed": false})
		elif m.has("wait"):
			cursor += int(m["wait"])
		elif m.has("hold"):
			var frames := int(m.get("frames", 1))
			if frames < 1:
				return "moves[%d].frames 必须 >= 1" % i
			schedule.append({"f": cursor, "action": str(m["hold"]), "pressed": true})
			schedule.append({"f": cursor + frames, "action": str(m["hold"]), "pressed": false})
			cursor += frames
		else:
			return "moves[%d] 无法识别：需要 tap/hold/wait/at 之一" % i
	for e in schedule:
		max_event_f = maxi(max_event_f, int(e["f"]))
	# 块长 = 游标终点与最远事件帧+1 的较大者，保证每个事件（含 release 尾巴）都在块内发出
	block_end = maxi(cursor, max_event_f + 1)
	return ""


func _pause_turn() -> void:
	Engine.time_scale = 1.0
	get_tree().paused = true
	turn += 1
	# 记录本运行区间的 物理帧→PNG 映射锚点
	var fm := FileAccess.open(FRAMEMAP_FILE, FileAccess.READ_WRITE)
	if fm == null:
		fm = FileAccess.open(FRAMEMAP_FILE, FileAccess.WRITE)
	else:
		fm.seek_end()
	fm.store_line(JSON.stringify({"f0": run_start_f, "p0": run_start_png, "f1": frame}))
	fm.close()
	prune_floor = _max_png_index() + PRUNE_LAG_MARGIN
	capture_pending = 15  # 0.5s 后把最新帧钉存为 current.png（等编码器冲刷）
	print("PILOT paused at f=%d turn=%d" % [frame, turn])
	_write_obs("paused", "")
	_write_state("paused")


## UI 内省：收集可见按钮（text/路径/全局矩形），供精确点击或 call 定位
func _ui_dump() -> void:
	var items: Array = []
	_collect_buttons(get_tree().root, items)
	_write_json_atomic(OUT_DIR + "/ui.json", JSON.stringify({"frame": frame, "buttons": items}, "  "))
	print("PILOT ui_dump: %d buttons" % items.size())


func _collect_buttons(node: Node, out: Array) -> void:
	if node is BaseButton and node.is_visible_in_tree():
		var r: Rect2 = node.get_global_rect()
		var label: String = str(node.get("text")) if node.get("text") != null else ""
		out.append({"text": label, "path": str(node.get_path()),
			"rect": [int(r.position.x), int(r.position.y), int(r.size.x), int(r.size.y)]})
	for c in node.get_children():
		_collect_buttons(c, out)


func _write_telemetry() -> void:
	# 场景切换型游戏：目标节点可能开局后才出现，惰性重解析
	if player_path != "" and not is_instance_valid(watch_root):
		watch_root = get_node_or_null(player_path)
	var rec := {"f": frame, "turn": turn}
	if watch_root != null:
		for w in watch:
			var key := str(w).split(":")[-1]
			rec[key] = watch_root.get_indexed(NodePath(str(w)))
	tele.store_line(JSON.stringify(rec))
	tele.flush()


func _max_png_index() -> int:
	var d := DirAccess.open(ProjectSettings.globalize_path(FRAMES_DIR))
	if d == null:
		return -1
	var best := -1
	d.list_dir_begin()
	var name := d.get_next()
	while name != "":
		if name.begins_with("movie") and name.ends_with(".png"):
			best = maxi(best, name.trim_prefix("movie").trim_suffix(".png").to_int())
		name = d.get_next()
	d.list_dir_end()
	return best


## 原子写：tmp + rename（agent 侧不会读到半截 JSON）
func _write_json_atomic(path: String, text: String) -> void:
	var tmp := path + ".tmp"
	var f := FileAccess.open(tmp, FileAccess.WRITE)
	f.store_string(text)
	f.close()
	DirAccess.rename_absolute(
		ProjectSettings.globalize_path(tmp),
		ProjectSettings.globalize_path(path))


## 把暂停时刻的最新帧拷贝为固定地址 out/current.png（agent 的「当前画面」永不失联）
func _pin_current_frame() -> void:
	var idx := _max_png_index()
	if idx < 0:
		return
	var src := ProjectSettings.globalize_path(FRAMES_DIR + "/movie%08d.png" % idx)
	DirAccess.copy_absolute(src, ProjectSettings.globalize_path(OUT_DIR + "/current.png"))
	_write_obs(last_status, last_hint)


func _write_obs(status: String, hint: String) -> void:
	last_status = status
	last_hint = hint
	var has_current := FileAccess.file_exists(OUT_DIR + "/current.png")
	var vp := get_viewport().get_visible_rect().size
	var obs := {
		"schema": 1,
		"status": status,
		"frame": frame,
		"turn": turn,
		"tps": tps,
		"movie_fps": movie_fps,
		"viewport": [int(vp.x), int(vp.y)],
		"current_frame_png": (".kimi-play/out/current.png" if has_current else ""),
		"frames_glob": ".kimi-play/out/frames/movie%08d.png",
		"framemap": ".kimi-play/out/framemap.jsonl",
		"telemetry": ".kimi-play/out/telemetry.jsonl",
		"input_history": ".kimi-play/out/input_history.jsonl",
		"ui_dump": ".kimi-play/out/ui.json",
		"hint": hint,
	}
	_write_json_atomic(OBS_FILE, JSON.stringify(obs, "  "))


func _write_state(status: String) -> void:
	_write_json_atomic(STATE_FILE, JSON.stringify({"frame": frame, "turn": turn, "status": status}))


func _check_heartbeat() -> void:
	if not FileAccess.file_exists(HEARTBEAT_FILE):
		return
	var mtime := FileAccess.get_modified_time(HEARTBEAT_FILE)
	if Time.get_unix_time_from_system() - mtime > HEARTBEAT_TIMEOUT_S:
		print("PILOT heartbeat stale > %ds, self-destruct" % int(HEARTBEAT_TIMEOUT_S))
		get_tree().quit()
