# ScriptEditorBase

> class ScriptEditorBase
> inherits ScriptEditorBase VBoxContainer

## Brief

Base editor for editing scripts in the `ScriptEditor`.

## Description

Base editor for editing scripts in the `ScriptEditor`. This does not include documentation items.

## Methods

> method add_syntax_highlighter(highlighter: EditorSyntaxHighlighter) -> void

Adds an `EditorSyntaxHighlighter` to the open script.

> method get_base_editor() -> Control ; qualifiers=const

Returns the underlying `Control` used for editing scripts. For text scripts, this is a `CodeEdit`.

## Signals

> signal edited_script_changed()

Emitted after script validation.

> signal go_to_help(what: String)

Emitted when the user requests a specific documentation page.

> signal go_to_method(script: Object, method: String)

Emitted when the user requests to view a specific method of a script, similar to `request_open_script_at_line`.

> signal name_changed()

Emitted after script validation or when the edited resource has changed.

> signal replace_in_files_requested(text: String)

Emitted when the user request to find and replace text in the file system.

> signal request_help(topic: String)

Emitted when the user requests contextual help.

> signal request_open_script_at_line(script: Object, line: int)

Emitted when the user requests to view a specific line of a script, similar to `go_to_method`.

> signal request_save_history()

Emitted when the user contextual goto and the item is in the same script.

> signal request_save_previous_state(state: Dictionary)

Emitted when the user changes current script or moves caret by 10 or more columns within the same script.

> signal search_in_files_requested(text: String)

Emitted when the user request to search text in the file system.
