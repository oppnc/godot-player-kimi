# EditorFileSystemImportFormatSupportQuery

> class EditorFileSystemImportFormatSupportQuery
> inherits EditorFileSystemImportFormatSupportQuery RefCounted

## Brief

Used to query and configure import format support.

## Description

This class is used to query and configure a certain import format. It is used in conjunction with asset format import plugins.

## Methods

> method _get_file_extensions() -> PackedStringArray ; qualifiers=virtual required const

Return the file extensions supported.

> method _is_active() -> bool ; qualifiers=virtual required const

Return whether this importer is active.

> method _query() -> bool ; qualifiers=virtual required const

Query support. Return `false` if import must not continue.
