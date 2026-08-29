# EditorSyntaxHighlighter

> class EditorSyntaxHighlighter
> inherits EditorSyntaxHighlighter SyntaxHighlighter

## Brief

Base class for `SyntaxHighlighter` used by the `ScriptEditor`.

## Description

Base class that all `SyntaxHighlighter`s used by the `ScriptEditor` extend from.
Add a syntax highlighter to an individual script by calling `ScriptEditorBase.add_syntax_highlighter`. To apply to all scripts on open, call `ScriptEditor.register_syntax_highlighter`.

## Methods

> method _create() -> EditorSyntaxHighlighter ; qualifiers=virtual const

Virtual method which creates a new instance of the syntax highlighter.

> method _get_name() -> String ; qualifiers=virtual const

Virtual method which can be overridden to return the syntax highlighter name.

> method _get_supported_languages() -> PackedStringArray ; qualifiers=virtual const

Virtual method which can be overridden to return the supported language names.
