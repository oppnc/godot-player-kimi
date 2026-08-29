# GraphElement

> class GraphElement
> inherits GraphElement Container

## Brief

A container that represents a basic element that can be placed inside a `GraphEdit` control.

## Description

`GraphElement` allows to create custom elements for a `GraphEdit` graph. By default such elements can be selected, resized, and repositioned, but they cannot be connected. For a graph element that allows for connections see `GraphNode`.

## Properties

> property draggable : bool ; default=true ; setter=set_draggable ; getter=is_draggable

If `true`, the user can drag the GraphElement.

> property position_offset : Vector2 ; default=Vector2(0, 0) ; setter=set_position_offset ; getter=get_position_offset

The offset of the GraphElement, relative to the scroll offset of the `GraphEdit`.

> property resizable : bool ; default=false ; setter=set_resizable ; getter=is_resizable

If `true`, the user can resize the GraphElement.
**Note:** Dragging the handle will only emit the `resize_request` and `resize_end` signals, the GraphElement needs to be resized manually.

> property scaling_menus : bool ; default=false ; setter=set_scaling_menus ; getter=is_scaling_menus

If `true`, `PopupMenu`s that are descendants of the GraphElement are scaled with the `GraphEdit` zoom.

> property selectable : bool ; default=true ; setter=set_selectable ; getter=is_selectable

If `true`, the user can select the GraphElement.

> property selected : bool ; default=false ; setter=set_selected ; getter=is_selected

If `true`, the GraphElement is selected.

## Signals

> signal delete_request()

Emitted when removing the GraphElement is requested.

> signal dragged(from: Vector2, to: Vector2)

Emitted when the GraphElement is dragged.

> signal node_deselected()

Emitted when the GraphElement is deselected.

> signal node_selected()

Emitted when the GraphElement is selected.

> signal position_offset_changed()

Emitted when the GraphElement is moved.

> signal raise_request()

Emitted when displaying the GraphElement over other ones is requested. Happens on focusing (clicking into) the GraphElement.

> signal resize_end(new_size: Vector2)

Emitted when releasing the mouse button after dragging the resizer handle (see `resizable`).

> signal resize_request(new_size: Vector2)

Emitted when resizing the GraphElement is requested. Happens on dragging the resizer handle (see `resizable`).

## Theme Properties

> theme_property resizer : Texture2D ; data=icon

The icon used for the resizer, visible when `resizable` is enabled.
