# ScriptExtension

> class ScriptExtension
> inherits ScriptExtension Script

## Methods

> method _can_instantiate() -> bool ; qualifiers=virtual required const

> method _editor_can_reload_from_file() -> bool ; qualifiers=virtual required

> method _get_base_script() -> Script ; qualifiers=virtual required const

> method _get_class_icon_path() -> String ; qualifiers=virtual const

> method _get_constants() -> Dictionary ; qualifiers=virtual required const

> method _get_doc_class_name() -> StringName ; qualifiers=virtual required const

> method _get_documentation() -> Array[Dictionary] ; qualifiers=virtual required const

> method _get_global_name() -> StringName ; qualifiers=virtual required const

> method _get_instance_base_type() -> StringName ; qualifiers=virtual required const

> method _get_language() -> ScriptLanguage ; qualifiers=virtual required const

> method _get_member_line(member: StringName) -> int ; qualifiers=virtual required const

> method _get_members() -> Array[StringName] ; qualifiers=virtual required const

> method _get_method_info(method: StringName) -> Dictionary ; qualifiers=virtual required const

> method _get_property_default_value(property: StringName) -> Variant ; qualifiers=virtual required const

> method _get_rpc_config() -> Variant ; qualifiers=virtual required const

> method _get_script_method_argument_count(method: StringName) -> Variant ; qualifiers=virtual const

Return the expected argument count for the given `method`, or `null` if it can't be determined (which will then fall back to the default behavior).

> method _get_script_method_list() -> Array[Dictionary] ; qualifiers=virtual required const

> method _get_script_property_list() -> Array[Dictionary] ; qualifiers=virtual required const

> method _get_script_signal_list() -> Array[Dictionary] ; qualifiers=virtual required const

> method _get_source_code() -> String ; qualifiers=virtual required const

> method _has_method(method: StringName) -> bool ; qualifiers=virtual required const

> method _has_property_default_value(property: StringName) -> bool ; qualifiers=virtual required const

> method _has_script_signal(signal: StringName) -> bool ; qualifiers=virtual required const

> method _has_source_code() -> bool ; qualifiers=virtual required const

> method _has_static_method(method: StringName) -> bool ; qualifiers=virtual required const

> method _inherits_script(script: Script) -> bool ; qualifiers=virtual required const

> method _instance_create(for_object: Object) -> void* ; qualifiers=virtual required const

> method _instance_has(object: Object) -> bool ; qualifiers=virtual const ; deprecated=This method is not called by the engine.

> method _is_abstract() -> bool ; qualifiers=virtual const

Returns `true` if the script is an abstract script. Abstract scripts cannot be instantiated directly, instead other scripts should inherit them. Abstract scripts will be either unselectable or hidden in the Create New Node dialog (unselectable if there are non-abstract classes inheriting it, otherwise hidden).

> method _is_placeholder_fallback_enabled() -> bool ; qualifiers=virtual required const

> method _is_tool() -> bool ; qualifiers=virtual required const

> method _is_valid() -> bool ; qualifiers=virtual required const

> method _placeholder_erased(placeholder: void*) -> void ; qualifiers=virtual

> method _placeholder_instance_create(for_object: Object) -> void* ; qualifiers=virtual required const

> method _reload(keep_state: bool) -> Error ; qualifiers=virtual required

> method _set_source_code(code: String) -> void ; qualifiers=virtual required

> method _update_exports() -> void ; qualifiers=virtual required
