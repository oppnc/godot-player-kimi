# ScriptBacktrace

> class ScriptBacktrace
> inherits ScriptBacktrace RefCounted

## Brief

A captured backtrace of a specific script language.

## Description

`ScriptBacktrace` holds an already captured backtrace of a specific script language, such as GDScript or C#, which are captured using `Engine.capture_script_backtraces`.
See `ProjectSettings.debug/settings/gdscript/always_track_call_stacks` and `ProjectSettings.debug/settings/gdscript/always_track_local_variables` for ways of controlling the contents of this class.

## Methods

> method format(indent_all: int = 0, indent_frames: int = 4) -> String ; qualifiers=const

Converts the backtrace to a `String`, where the entire string will be indented by `indent_all` number of spaces, and the individual stack frames will be additionally indented by `indent_frames` number of spaces.
**Note:** Calling `Object.to_string` on a `ScriptBacktrace` will produce the same output as calling `format` with all parameters left at their default values.

> method get_frame_count() -> int ; qualifiers=const

Returns the number of stack frames in the backtrace.

> method get_frame_file(index: int) -> String ; qualifiers=const

Returns the file name of the call site represented by the stack frame at the specified index.

> method get_frame_function(index: int) -> String ; qualifiers=const

Returns the name of the function called at the stack frame at the specified index.

> method get_frame_line(index: int) -> int ; qualifiers=const

Returns the line number of the call site represented by the stack frame at the specified index.

> method get_global_variable_count() -> int ; qualifiers=const

Returns the number of global variables (e.g. autoload singletons) in the backtrace.
**Note:** This will be non-zero only if the `include_variables` parameter was `true` when capturing the backtrace with `Engine.capture_script_backtraces`.

> method get_global_variable_name(variable_index: int) -> String ; qualifiers=const

Returns the name of the global variable at the specified index.

> method get_global_variable_value(variable_index: int) -> Variant ; qualifiers=const

Returns the value of the global variable at the specified index.
**Warning:** With GDScript backtraces, the returned `Variant` will be the variable's actual value, including any object references. This means that storing the returned `Variant` will prevent any such object from being deallocated, so it's generally recommended not to do so.

> method get_language_name() -> String ; qualifiers=const

Returns the name of the script language that this backtrace was captured from.

> method get_local_variable_count(frame_index: int) -> int ; qualifiers=const

Returns the number of local variables in the stack frame at the specified index.
**Note:** This will be non-zero only if the `include_variables` parameter was `true` when capturing the backtrace with `Engine.capture_script_backtraces`.

> method get_local_variable_name(frame_index: int, variable_index: int) -> String ; qualifiers=const

Returns the name of the local variable at the specified `variable_index` in the stack frame at the specified `frame_index`.

> method get_local_variable_value(frame_index: int, variable_index: int) -> Variant ; qualifiers=const

Returns the value of the local variable at the specified `variable_index` in the stack frame at the specified `frame_index`.
**Warning:** With GDScript backtraces, the returned `Variant` will be the variable's actual value, including any object references. This means that storing the returned `Variant` will prevent any such object from being deallocated, so it's generally recommended not to do so.

> method get_member_variable_count(frame_index: int) -> int ; qualifiers=const

Returns the number of member variables in the stack frame at the specified index.
**Note:** This will be non-zero only if the `include_variables` parameter was `true` when capturing the backtrace with `Engine.capture_script_backtraces`.

> method get_member_variable_name(frame_index: int, variable_index: int) -> String ; qualifiers=const

Returns the name of the member variable at the specified `variable_index` in the stack frame at the specified `frame_index`.

> method get_member_variable_value(frame_index: int, variable_index: int) -> Variant ; qualifiers=const

Returns the value of the member variable at the specified `variable_index` in the stack frame at the specified `frame_index`.
**Warning:** With GDScript backtraces, the returned `Variant` will be the variable's actual value, including any object references. This means that storing the returned `Variant` will prevent any such object from being deallocated, so it's generally recommended not to do so.

> method is_empty() -> bool ; qualifiers=const

Returns `true` if the backtrace has no stack frames.
