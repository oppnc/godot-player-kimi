extends Node2D

var player: ColorRect
var hud: Label
var frame_count := 0
var pos := Vector2(320, 240)
var replay: Array = []

func _ready() -> void:
	var bg := ColorRect.new()
	bg.color = Color(0.12, 0.12, 0.15)
	bg.size = Vector2(640, 360)
	add_child(bg)

	player = ColorRect.new()
	player.color = Color(1.0, 0.3, 0.3)
	player.size = Vector2(24, 24)
	add_child(player)

	hud = Label.new()
	hud.position = Vector2(8, 8)
	add_child(hud)

	var f := FileAccess.open("res://replay.json", FileAccess.READ)
	if f:
		replay = JSON.parse_string(f.get_as_text()).get("events", [])
	seed(12345)

func _physics_process(delta: float) -> void:
	for e in replay:
		if int(e.frame) == frame_count:
			var ev := InputEventAction.new()
			ev.action = e.action
			ev.pressed = e.pressed
			Input.parse_input_event(ev)

	var dir := Input.get_axis("ui_left", "ui_right")
	pos.x += dir * 180.0 * delta
	pos.x = clampf(pos.x, 12.0, 628.0)
	player.position = pos - player.size / 2.0
	hud.text = "frame %d  x=%d" % [frame_count, int(pos.x)]
	print("DBG f=%d R=%s L=%s x=%.1f" % [frame_count, Input.is_action_pressed("ui_right"), Input.is_action_pressed("ui_left"), pos.x])
	frame_count += 1
