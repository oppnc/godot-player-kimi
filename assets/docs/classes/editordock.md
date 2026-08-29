# EditorDock

> class EditorDock ; experimental=This class may be changed or removed in future versions.
> inherits EditorDock MarginContainer

## Brief

Dockable container for the editor.

## Description

EditorDock is a `Container` node that can be docked in one of the editor's dock slots. Docks are added by plugins to provide space for controls related to an `EditorPlugin`. The editor comes with a few built-in docks, such as the Scene dock, FileSystem dock, etc.
You can add a dock by using `EditorPlugin.add_dock`. The dock can be customized by changing its properties.

```text
        @tool
        extends EditorPlugin

        # Dock reference.
        var dock

        # Plugin initialization.
        func _enter_tree():
            dock = EditorDock.new()
            dock.title = "My Dock"
            dock.dock_icon = preload("./dock_icon.png")
            dock.default_slot = EditorDock.DOCK_SLOT_RIGHT_UL
            var dock_content = preload("./dock_content.tscn").instantiate()
            dock.add_child(dock_content)
            add_dock(dock)

        # Plugin clean-up.
        func _exit_tree():
            remove_dock(dock)
            dock.queue_free()
            dock = null

```

## Properties

> property accessibility_region : bool ; default=true ; setter=set_accessibility_region ; getter=is_accessibility_region ; overrides=Container

> property available_layouts : BitField[DockLayout] ; default=5 ; setter=set_available_layouts ; getter=get_available_layouts

The available layouts for this dock, as a bitmask. By default, the dock allows vertical and floating layouts.

> property closable : bool ; default=false ; setter=set_closable ; getter=is_closable

If `true`, the dock can be closed with the Close button in the context popup. Docks with `global` enabled are always closable.

> property default_slot : DockSlot ; default=-1 ; setter=set_default_slot ; getter=get_default_slot

The default dock slot used when adding the dock with `EditorPlugin.add_dock`.
After the dock is added, it can be moved to a different slot and the editor will automatically remember its position between sessions. If you remove and re-add the dock, it will be reset to default.

> property dock_icon : Texture2D ; setter=set_dock_icon ; getter=get_dock_icon

The icon for the dock, as a texture. If specified, it will override `icon_name`.

> property dock_shortcut : Shortcut ; setter=set_dock_shortcut ; getter=get_dock_shortcut

The shortcut used to open the dock.

> property force_show_icon : bool ; default=false ; setter=set_force_show_icon ; getter=get_force_show_icon

If `true`, the dock will always display an icon, regardless of `EditorSettings.interface/editor/docks/dock_tab_style` or `EditorSettings.interface/editor/docks/bottom_dock_tab_style`.

> property global : bool ; default=true ; setter=set_global ; getter=is_global

If `true`, the dock appears in the **Editor > Editor Docks** menu and can be closed. Non-global docks can still be closed using `close` or when `closable` is `true`.

> property icon_name : StringName ; default=&"" ; setter=set_icon_name ; getter=get_icon_name

The icon for the dock, as a name from the `EditorIcons` theme type in the editor theme. You can find the list of available icons [here](https://godot-editor-icons.github.io/).

> property layout_key : String ; default="" ; setter=set_layout_key ; getter=get_layout_key

The key representing this dock in the editor's layout file. If empty, the dock's displayed name will be used instead.

> property title : String ; default="" ; setter=set_title ; getter=get_title

The title of the dock's tab. If empty, the dock's `Node.name` will be used. If the name is auto-generated (contains `@`), the first child's name will be used instead.

> property title_color : Color ; default=Color(0, 0, 0, 0) ; setter=set_title_color ; getter=get_title_color

The color of the dock tab's title. If its alpha is `0.0`, the default font color will be used.

> property transient : bool ; default=false ; setter=set_transient ; getter=is_transient

If `true`, the dock is not automatically opened or closed when loading an editor layout, only moved. It also can't be opened using a shortcut. This is meant for docks that are opened and closed in specific cases, such as when selecting a `TileMap` or `AnimationTree` node.

## Methods

> method _load_layout_from_config(config: ConfigFile, section: String) -> void ; qualifiers=virtual

Implement this method to handle loading this dock's layout. It's equivalent to `EditorPlugin._set_window_layout`. `section` is a unique section based on `layout_key`.

> method _save_layout_to_config(config: ConfigFile, section: String) -> void ; qualifiers=virtual const

Implement this method to handle saving this dock's layout. It's equivalent to `EditorPlugin._get_window_layout`. `section` is a unique section based on `layout_key`.

> method _update_layout(layout: int) -> void ; qualifiers=virtual

Implement this method to handle the layout switching for this dock. `layout` is one of the `DockLayout` constants.

```text
                func _update_layout(layout):
                    box_container.vertical = (layout == DOCK_LAYOUT_VERTICAL)

```

> method close() -> void

Closes the dock, making its tab hidden.

> method make_visible() -> void

Focuses the dock's tab (or window if it's floating). If the dock was closed, it will be opened. If it's a bottom dock, makes the bottom panel visible.

> method open() -> void

Opens the dock. It will appear in the last used dock slot. If the dock has no default slot, it will be opened floating.
**Note:** This does not focus the dock. If you want to open and focus the dock, use `make_visible`.

## Signals

> signal closed()

Emitted when the dock is closed with the Close button in the context popup, before it's removed from its parent. See `closable`.

> signal opened()

Emitted when the dock is opened via the Editor > Editor Docks menu, before it's made visible.

## Enumerations

> enum DockLayout ; bitfield=true

> enum_value DockLayout.DOCK_LAYOUT_VERTICAL = 1

Allows placing the dock in the vertical dock slots on either side of the editor.

> enum_value DockLayout.DOCK_LAYOUT_HORIZONTAL = 2

Allows placing the dock in the horizontal dock slots at the bottom.

> enum_value DockLayout.DOCK_LAYOUT_FLOATING = 4

Allows making the dock floating (opened as a separate window).

> enum_value DockLayout.DOCK_LAYOUT_ALL = 7

Allows placing the dock in all available slots.

> enum DockSlot

> enum_value DockSlot.DOCK_SLOT_NONE = -1

The dock is closed.

> enum_value DockSlot.DOCK_SLOT_LEFT_UL = 0

Dock slot, left side, upper-left (empty in default layout).

> enum_value DockSlot.DOCK_SLOT_LEFT_BL = 1

Dock slot, left side, bottom-left (empty in default layout).

> enum_value DockSlot.DOCK_SLOT_LEFT_UR = 2

Dock slot, left side, upper-right (in default layout includes Scene and Import docks).

> enum_value DockSlot.DOCK_SLOT_LEFT_BR = 3

Dock slot, left side, bottom-right (in default layout includes FileSystem and History docks).

> enum_value DockSlot.DOCK_SLOT_RIGHT_UL = 4

Dock slot, right side, upper-left (in default layout includes Inspector, Signal, and Group docks).

> enum_value DockSlot.DOCK_SLOT_RIGHT_BL = 5

Dock slot, right side, bottom-left (empty in default layout).

> enum_value DockSlot.DOCK_SLOT_RIGHT_UR = 6

Dock slot, right side, upper-right (empty in default layout).

> enum_value DockSlot.DOCK_SLOT_RIGHT_BR = 7

Dock slot, right side, bottom-right (empty in default layout).

> enum_value DockSlot.DOCK_SLOT_BOTTOM = 8

Bottom panel.

> enum_value DockSlot.DOCK_SLOT_BOTTOM_L = 9

Dock slot at the bottom, below bottom panel, on the left side.

> enum_value DockSlot.DOCK_SLOT_BOTTOM_R = 10

Dock slot at the bottom, below bottom panel, on the right side.

> enum_value DockSlot.DOCK_SLOT_MAX = 11

Represents the size of the `DockSlot` enum.

## Tutorials
- [Making plugins]($DOCS_URL/tutorials/plugins/editor/making_plugins.html)
