# ScriptLanguageExtension

> class ScriptLanguageExtension
> inherits ScriptLanguageExtension ScriptLanguage

## Methods

> method _add_global_constant(name: StringName, value: Variant) -> void ; qualifiers=virtual required

> method _add_named_global_constant(name: StringName, value: Variant) -> void ; qualifiers=virtual required

> method _auto_indent_code(code: String, from_line: int, to_line: int) -> String ; qualifiers=virtual required const

> method _can_inherit_from_file() -> bool ; qualifiers=virtual required const

> method _can_make_function() -> bool ; qualifiers=virtual required const

> method _complete_code(code: String, path: String, owner: Object) -> Dictionary ; qualifiers=virtual required const

> method _create_script() -> Object ; qualifiers=virtual const ; deprecated=This method is not called by the engine.

> method _debug_get_current_stack_info() -> Array[Dictionary] ; qualifiers=virtual required

> method _debug_get_error() -> String ; qualifiers=virtual required const

> method _debug_get_globals(max_subitems: int, max_depth: int) -> Dictionary ; qualifiers=virtual required

> method _debug_get_stack_level_count() -> int ; qualifiers=virtual required const

> method _debug_get_stack_level_function(level: int) -> String ; qualifiers=virtual required const

> method _debug_get_stack_level_instance(level: int) -> void* ; qualifiers=virtual required

> method _debug_get_stack_level_line(level: int) -> int ; qualifiers=virtual required const

> method _debug_get_stack_level_locals(level: int, max_subitems: int, max_depth: int) -> Dictionary ; qualifiers=virtual required

> method _debug_get_stack_level_members(level: int, max_subitems: int, max_depth: int) -> Dictionary ; qualifiers=virtual required

> method _debug_get_stack_level_source(level: int) -> String ; qualifiers=virtual required const

Returns the source associated with a given debug stack position.

> method _debug_parse_stack_level_expression(level: int, expression: String, max_subitems: int, max_depth: int) -> String ; qualifiers=virtual required

> method _find_function(function: String, code: String) -> int ; qualifiers=virtual required const

Returns the line where the function is defined in the code, or `-1` if the function is not present.

> method _finish() -> void ; qualifiers=virtual required

> method _frame() -> void ; qualifiers=virtual required

> method _get_built_in_templates(object: StringName) -> Array[Dictionary] ; qualifiers=virtual required const

> method _get_comment_delimiters() -> PackedStringArray ; qualifiers=virtual required const

> method _get_doc_comment_delimiters() -> PackedStringArray ; qualifiers=virtual const

> method _get_extension() -> String ; qualifiers=virtual required const

> method _get_global_class_name(path: String) -> Dictionary ; qualifiers=virtual required const

> method _get_name() -> String ; qualifiers=virtual required const

> method _get_public_annotations() -> Array[Dictionary] ; qualifiers=virtual required const

> method _get_public_constants() -> Dictionary ; qualifiers=virtual required const

> method _get_public_functions() -> Array[Dictionary] ; qualifiers=virtual required const

> method _get_recognized_extensions() -> PackedStringArray ; qualifiers=virtual required const

> method _get_reserved_words() -> PackedStringArray ; qualifiers=virtual required const

> method _get_string_delimiters() -> PackedStringArray ; qualifiers=virtual required const

> method _get_type() -> String ; qualifiers=virtual required const

> method _handles_global_class_type(type: String) -> bool ; qualifiers=virtual required const

> method _has_named_classes() -> bool ; qualifiers=virtual const ; deprecated=This method is not called by the engine.

> method _init() -> void ; qualifiers=virtual required

> method _is_control_flow_keyword(keyword: String) -> bool ; qualifiers=virtual required const

> method _is_using_templates() -> bool ; qualifiers=virtual required

> method _lookup_code(code: String, symbol: String, path: String, owner: Object) -> Dictionary ; qualifiers=virtual required const

> method _make_function(class_name: String, function_name: String, function_args: PackedStringArray) -> String ; qualifiers=virtual required const

> method _make_template(template: String, class_name: String, base_class_name: String) -> Script ; qualifiers=virtual required const

> method _open_in_external_editor(script: Script, line: int, column: int) -> Error ; qualifiers=virtual required

> method _overrides_external_editor() -> bool ; qualifiers=virtual required

> method _preferred_file_name_casing() -> ScriptLanguage.ScriptNameCasing ; qualifiers=virtual const

> method _profiling_get_accumulated_data(info_array: ScriptLanguageExtensionProfilingInfo*, info_max: int) -> int ; qualifiers=virtual required

> method _profiling_get_frame_data(info_array: ScriptLanguageExtensionProfilingInfo*, info_max: int) -> int ; qualifiers=virtual required

> method _profiling_set_save_native_calls(enable: bool) -> void ; qualifiers=virtual required

> method _profiling_start() -> void ; qualifiers=virtual required

> method _profiling_stop() -> void ; qualifiers=virtual required

> method _reload_all_scripts() -> void ; qualifiers=virtual required

> method _reload_scripts(scripts: Array, soft_reload: bool) -> void ; qualifiers=virtual required

Reloads all `scripts` from disk and the specifics of how that happens is `ScriptLanguageExtension` specific.

> method _reload_tool_script(script: Script, soft_reload: bool) -> void ; qualifiers=virtual required

Reloads the given `script` from disk and the specifics of how that happens is `ScriptLanguageExtension` specific.

> method _remove_named_global_constant(name: StringName) -> void ; qualifiers=virtual required

> method _supports_builtin_mode() -> bool ; qualifiers=virtual required const

> method _supports_documentation() -> bool ; qualifiers=virtual required const

> method _thread_enter() -> void ; qualifiers=virtual required

> method _thread_exit() -> void ; qualifiers=virtual required

> method _validate(script: String, path: String, validate_functions: bool, validate_errors: bool, validate_warnings: bool, validate_safe_lines: bool) -> Dictionary ; qualifiers=virtual required const

> method _validate_path(path: String) -> String ; qualifiers=virtual required const

## Enumerations

> enum CodeCompletionKind

> enum_value CodeCompletionKind.CODE_COMPLETION_KIND_CLASS = 0

> enum_value CodeCompletionKind.CODE_COMPLETION_KIND_FUNCTION = 1

> enum_value CodeCompletionKind.CODE_COMPLETION_KIND_SIGNAL = 2

> enum_value CodeCompletionKind.CODE_COMPLETION_KIND_VARIABLE = 3

> enum_value CodeCompletionKind.CODE_COMPLETION_KIND_MEMBER = 4

> enum_value CodeCompletionKind.CODE_COMPLETION_KIND_ENUM = 5

> enum_value CodeCompletionKind.CODE_COMPLETION_KIND_CONSTANT = 6

> enum_value CodeCompletionKind.CODE_COMPLETION_KIND_NODE_PATH = 7

> enum_value CodeCompletionKind.CODE_COMPLETION_KIND_FILE_PATH = 8

> enum_value CodeCompletionKind.CODE_COMPLETION_KIND_PLAIN_TEXT = 9

> enum_value CodeCompletionKind.CODE_COMPLETION_KIND_KEYWORD = 10

> enum_value CodeCompletionKind.CODE_COMPLETION_KIND_MAX = 11

> enum CodeCompletionLocation

> enum_value CodeCompletionLocation.LOCATION_LOCAL = 0

The option is local to the location of the code completion query - e.g. a local variable. Subsequent value of location represent options from the outer class, the exact value represent how far they are (in terms of inner classes).

> enum_value CodeCompletionLocation.LOCATION_PARENT_MASK = 256

The option is from the containing class or a parent class, relative to the location of the code completion query. Perform a bitwise OR with the class depth (e.g. `0` for the local class, `1` for the parent, `2` for the grandparent, etc.) to store the depth of an option in the class or a parent class.

> enum_value CodeCompletionLocation.LOCATION_OTHER_USER_CODE = 512

The option is from user code which is not local and not in a derived class (e.g. Autoload Singletons).

> enum_value CodeCompletionLocation.LOCATION_OTHER = 1024

The option is from other engine code, not covered by the other enum constants - e.g. built-in classes.

> enum LookupResultType

> enum_value LookupResultType.LOOKUP_RESULT_SCRIPT_LOCATION = 0

> enum_value LookupResultType.LOOKUP_RESULT_CLASS = 1

> enum_value LookupResultType.LOOKUP_RESULT_CLASS_CONSTANT = 2

> enum_value LookupResultType.LOOKUP_RESULT_CLASS_PROPERTY = 3

> enum_value LookupResultType.LOOKUP_RESULT_CLASS_METHOD = 4

> enum_value LookupResultType.LOOKUP_RESULT_CLASS_SIGNAL = 5

> enum_value LookupResultType.LOOKUP_RESULT_CLASS_ENUM = 6

> enum_value LookupResultType.LOOKUP_RESULT_CLASS_TBD_GLOBALSCOPE = 7 ; deprecated=This constant is deprecated.

> enum_value LookupResultType.LOOKUP_RESULT_CLASS_ANNOTATION = 8

> enum_value LookupResultType.LOOKUP_RESULT_LOCAL_CONSTANT = 9

> enum_value LookupResultType.LOOKUP_RESULT_LOCAL_VARIABLE = 10

> enum_value LookupResultType.LOOKUP_RESULT_MAX = 11
