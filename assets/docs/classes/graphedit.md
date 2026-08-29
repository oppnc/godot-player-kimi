# GraphEdit

> class GraphEdit
> inherits GraphEdit Control

## Brief

An editor for graph-like structures, using `GraphNode`s.

## Description

`GraphEdit` provides tools for creation, manipulation, and display of various graphs. Its main purpose in the engine is to power the visual programming systems, such as visual shaders, but it is also available for use in user projects.
`GraphEdit` by itself is only an empty container, representing an infinite grid where `GraphNode`s can be placed. Each `GraphNode` represents a node in the graph, a single unit of data in the connected scheme. `GraphEdit`, in turn, helps to control various interactions with nodes and between nodes. When the user attempts to connect, disconnect, or delete a `GraphNode`, a signal is emitted in the `GraphEdit`, but no action is taken by default. It is the responsibility of the programmer utilizing this control to implement the necessary logic to determine how each request should be handled.
**Performance:** It is greatly advised to enable low-processor usage mode (see `OS.low_processor_usage_mode`) when using GraphEdits.
**Note:** Keep in mind that `Node.get_children` will also return the connection layer node named `_connection_layer` due to technical limitations. This behavior may change in future releases.

## Properties

> property clip_contents : bool ; default=true ; setter=set_clip_contents ; getter=is_clipping_contents ; overrides=Control

> property connection_lines_antialiased : bool ; default=true ; setter=set_connection_lines_antialiased ; getter=is_connection_lines_antialiased

If `true`, the lines between nodes will use antialiasing.

> property connection_lines_curvature : float ; default=0.5 ; setter=set_connection_lines_curvature ; getter=get_connection_lines_curvature

The curvature of the lines between the nodes. 0 results in straight lines.

> property connection_lines_thickness : float ; default=4.0 ; setter=set_connection_lines_thickness ; getter=get_connection_lines_thickness

The thickness of the lines between the nodes.

> property connections : Array[Dictionary] ; default=[] ; setter=set_connections ; getter=get_connection_list

The connections between `GraphNode`s.
A connection is represented as a `Dictionary` in the form of:

```text
            {
                from_node: StringName,
                from_port: int,
                to_node: StringName,
                to_port: int,
                keep_alive: bool
            }

```

Connections with `keep_alive` set to `false` may be deleted automatically if invalid during a redraw.

> property focus_mode : Control.FocusMode ; default=2 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property grid_pattern : GridPattern ; default=0 ; setter=set_grid_pattern ; getter=get_grid_pattern

The pattern used for drawing the grid.

> property minimap_enabled : bool ; default=true ; setter=set_minimap_enabled ; getter=is_minimap_enabled

If `true`, the minimap is visible.

> property minimap_opacity : float ; default=0.65 ; setter=set_minimap_opacity ; getter=get_minimap_opacity

The opacity of the minimap rectangle.

> property minimap_size : Vector2 ; default=Vector2(240, 160) ; setter=set_minimap_size ; getter=get_minimap_size

The size of the minimap rectangle. The map itself is based on the size of the grid area and is scaled to fit this rectangle.

> property panning_scheme : PanningScheme ; default=0 ; setter=set_panning_scheme ; getter=get_panning_scheme

Defines the control scheme for panning with mouse wheel.

> property right_disconnects : bool ; default=false ; setter=set_right_disconnects ; getter=is_right_disconnects_enabled

If `true`, enables disconnection of existing connections in the GraphEdit by dragging the right end.

> property scroll_offset : Vector2 ; default=Vector2(0, 0) ; setter=set_scroll_offset ; getter=get_scroll_offset

The scroll offset.

> property show_arrange_button : bool ; default=true ; setter=set_show_arrange_button ; getter=is_showing_arrange_button

If `true`, the button to automatically arrange graph nodes is visible.

> property show_grid : bool ; default=true ; setter=set_show_grid ; getter=is_showing_grid

If `true`, the grid is visible.

> property show_grid_buttons : bool ; default=true ; setter=set_show_grid_buttons ; getter=is_showing_grid_buttons

If `true`, buttons that allow to configure grid and snapping options are visible.

> property show_menu : bool ; default=true ; setter=set_show_menu ; getter=is_showing_menu

If `true`, the menu toolbar is visible.

> property show_minimap_button : bool ; default=true ; setter=set_show_minimap_button ; getter=is_showing_minimap_button

If `true`, the button to toggle the minimap is visible.

> property show_zoom_buttons : bool ; default=true ; setter=set_show_zoom_buttons ; getter=is_showing_zoom_buttons

If `true`, buttons that allow to change and reset the zoom level are visible.

> property show_zoom_label : bool ; default=false ; setter=set_show_zoom_label ; getter=is_showing_zoom_label

If `true`, the label with the current zoom level is visible. The zoom level is displayed in percents.

> property snapping_distance : int ; default=20 ; setter=set_snapping_distance ; getter=get_snapping_distance

The snapping distance in pixels, also determines the grid line distance.

> property snapping_enabled : bool ; default=true ; setter=set_snapping_enabled ; getter=is_snapping_enabled

If `true`, enables snapping.

> property type_names : Dictionary ; default={} ; setter=set_type_names ; getter=get_type_names

`Dictionary` of human-readable port type names.

> property zoom : float ; default=1.0 ; setter=set_zoom ; getter=get_zoom

The current zoom value.

> property zoom_max : float ; default=2.0736003 ; setter=set_zoom_max ; getter=get_zoom_max

The upper zoom limit.

> property zoom_min : float ; default=0.23256795 ; setter=set_zoom_min ; getter=get_zoom_min

The lower zoom limit.

> property zoom_step : float ; default=1.2 ; setter=set_zoom_step ; getter=get_zoom_step

The step of each zoom level.

## Methods

> method _get_connection_line(from_position: Vector2, to_position: Vector2) -> PackedVector2Array ; qualifiers=virtual const

Virtual method which can be overridden to customize how connections are drawn.

> method _is_in_input_hotzone(in_node: Object, in_port: int, mouse_position: Vector2) -> bool ; qualifiers=virtual

Returns whether the `mouse_position` is in the input hot zone.
By default, a hot zone is a `Rect2` positioned such that its center is at `in_node`.`GraphNode.get_input_port_position`(`in_port`) (For output's case, call `GraphNode.get_output_port_position` instead). The hot zone's width is twice the Theme Property `port_grab_distance_horizontal`, and its height is twice the `port_grab_distance_vertical`.
Below is a sample code to help get started:

```text
                func _is_in_input_hotzone(in_node, in_port, mouse_position):
                    var port_size = Vector2(get_theme_constant("port_grab_distance_horizontal"), get_theme_constant("port_grab_distance_vertical"))
                    var port_pos = in_node.get_position() + in_node.get_input_port_position(in_port) - port_size / 2
                    var rect = Rect2(port_pos, port_size)

                    return rect.has_point(mouse_position)

```

> method _is_in_output_hotzone(in_node: Object, in_port: int, mouse_position: Vector2) -> bool ; qualifiers=virtual

Returns whether the `mouse_position` is in the output hot zone. For more information on hot zones, see `_is_in_input_hotzone`.
Below is a sample code to help get started:

```text
                func _is_in_output_hotzone(in_node, in_port, mouse_position):
                    var port_size = Vector2(get_theme_constant("port_grab_distance_horizontal"), get_theme_constant("port_grab_distance_vertical"))
                    var port_pos = in_node.get_position() + in_node.get_output_port_position(in_port) - port_size / 2
                    var rect = Rect2(port_pos, port_size)

                    return rect.has_point(mouse_position)

```

> method _is_node_hover_valid(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> bool ; qualifiers=virtual

This virtual method can be used to insert additional error detection while the user is dragging a connection over a valid port.
Return `true` if the connection is indeed valid or return `false` if the connection is impossible. If the connection is impossible, no snapping to the port and thus no connection request to that port will happen.
In this example a connection to same node is suppressed:

```gdscript
                func _is_node_hover_valid(from, from_port, to, to_port):
                    return from != to

```

```csharp
                public override bool _IsNodeHoverValid(StringName fromNode, int fromPort, StringName toNode, int toPort)
                {
                    return fromNode != toNode;
                }

```

> method add_valid_connection_type(from_type: int, to_type: int) -> void

Allows the connection between two different port types. The port type is defined individually for the left and the right port of each slot with the `GraphNode.set_slot` method.
See also `is_valid_connection_type` and `remove_valid_connection_type`.

> method add_valid_left_disconnect_type(type: int) -> void

Allows to disconnect nodes when dragging from the left port of the `GraphNode`'s slot if it has the specified type. See also `remove_valid_left_disconnect_type`.

> method add_valid_right_disconnect_type(type: int) -> void

Allows to disconnect nodes when dragging from the right port of the `GraphNode`'s slot if it has the specified type. See also `remove_valid_right_disconnect_type`.

> method arrange_nodes() -> void

Rearranges selected nodes in a layout with minimum crossings between connections and uniform horizontal and vertical gap between nodes.

> method attach_graph_element_to_frame(element: StringName, frame: StringName) -> void

Attaches the `element` `GraphElement` to the `frame` `GraphFrame`.

> method clear_connections() -> void

Removes all connections between nodes.

> method connect_node(from_node: StringName, from_port: int, to_node: StringName, to_port: int, keep_alive: bool = false) -> Error

Create a connection between the `from_port` of the `from_node` `GraphNode` and the `to_port` of the `to_node` `GraphNode`. If the connection already exists, no connection is created.
Connections with `keep_alive` set to `false` may be deleted automatically if invalid during a redraw.

> method detach_graph_element_from_frame(element: StringName) -> void

Detaches the `element` `GraphElement` from the `GraphFrame` it is currently attached to.

> method disconnect_node(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> void

Removes the connection between the `from_port` of the `from_node` `GraphNode` and the `to_port` of the `to_node` `GraphNode`. If the connection does not exist, no connection is removed.

> method force_connection_drag_end() -> void

Ends the creation of the current connection. In other words, if you are dragging a connection you can use this method to abort the process and remove the line that followed your cursor.
This is best used together with `connection_drag_started` and `connection_drag_ended` to add custom behavior like node addition through shortcuts.
**Note:** This method suppresses any other connection request signals apart from `connection_drag_ended`.

> method get_attached_nodes_of_frame(frame: StringName) -> Array[StringName]

Returns an array of node names that are attached to the `GraphFrame` with the given name.

> method get_closest_connection_at_point(point: Vector2, max_distance: float = 4.0) -> Dictionary ; qualifiers=const

Returns the closest connection to the given point in screen space. If no connection is found within `max_distance` pixels, an empty `Dictionary` is returned.
A connection is represented as a `Dictionary` in the form of:

```text
                {
                    from_node: StringName,
                    from_port: int,
                    to_node: StringName,
                    to_port: int,
                    keep_alive: bool
                }

```

For example, getting a connection at a given mouse position can be achieved like this:

```gdscript
                var connection = get_closest_connection_at_point(mouse_event.get_position())

```

> method get_connection_count(from_node: StringName, from_port: int) -> int

Returns the number of connections from `from_port` of `from_node`.

> method get_connection_line(from_node: Vector2, to_node: Vector2) -> PackedVector2Array ; qualifiers=const

Returns the points which would make up a connection between `from_node` and `to_node`.

> method get_connection_list_from_node(node: StringName) -> Array[Dictionary] ; qualifiers=const

Returns an `Array` containing a list of all connections for `node`.
A connection is represented as a `Dictionary` in the form of:

```text
                {
                    from_node: StringName,
                    from_port: int,
                    to_node: StringName,
                    to_port: int,
                    keep_alive: bool
                }

```

**Example:** Get all connections on a specific port:

```text
                func get_connection_list_from_port(node, port):
                    var connections = get_connection_list_from_node(node)
                    var result = []
                    for connection in connections:
                        var dict = {}
                        if connection["from_node"] == node and connection["from_port"] == port:
                            dict["node"] = connection["to_node"]
                            dict["port"] = connection["to_port"]
                            dict["type"] = "left"
                            result.push_back(dict)
                        elif connection["to_node"] == node and connection["to_port"] == port:
                            dict["node"] = connection["from_node"]
                            dict["port"] = connection["from_port"]
                            dict["type"] = "right"
                            result.push_back(dict)
                    return result

```

> method get_connections_intersecting_with_rect(rect: Rect2) -> Array[Dictionary] ; qualifiers=const

Returns an `Array` containing the list of connections that intersect with the given `Rect2`.
A connection is represented as a `Dictionary` in the form of:

```text
                {
                    from_node: StringName,
                    from_port: int,
                    to_node: StringName,
                    to_port: int,
                    keep_alive: bool
                }

```

> method get_element_frame(element: StringName) -> GraphFrame

Returns the `GraphFrame` that contains the `GraphElement` with the given name.

> method get_menu_hbox() -> HBoxContainer

Gets the `HBoxContainer` that contains the zooming and grid snap controls in the top left of the graph. You can use this method to reposition the toolbar or to add your own custom controls to it.
**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their `CanvasItem.visible` property.

> method is_node_connected(from_node: StringName, from_port: int, to_node: StringName, to_port: int) -> bool

Returns `true` if the `from_port` of the `from_node` `GraphNode` is connected to the `to_port` of the `to_node` `GraphNode`.

> method is_valid_connection_type(from_type: int, to_type: int) -> bool ; qualifiers=const

Returns whether it's possible to make a connection between two different port types. The port type is defined individually for the left and the right port of each slot with the `GraphNode.set_slot` method.
See also `add_valid_connection_type` and `remove_valid_connection_type`.

> method remove_valid_connection_type(from_type: int, to_type: int) -> void

Disallows the connection between two different port types previously allowed by `add_valid_connection_type`. The port type is defined individually for the left and the right port of each slot with the `GraphNode.set_slot` method.
See also `is_valid_connection_type`.

> method remove_valid_left_disconnect_type(type: int) -> void

Disallows to disconnect nodes when dragging from the left port of the `GraphNode`'s slot if it has the specified type. Use this to disable a disconnection previously allowed with `add_valid_left_disconnect_type`.

> method remove_valid_right_disconnect_type(type: int) -> void

Disallows to disconnect nodes when dragging from the right port of the `GraphNode`'s slot if it has the specified type. Use this to disable a disconnection previously allowed with `add_valid_right_disconnect_type`.

> method set_connection_activity(from_node: StringName, from_port: int, to_node: StringName, to_port: int, amount: float) -> void

Sets the coloration of the connection between `from_node`'s `from_port` and `to_node`'s `to_port` with the color provided in the `activity` theme property. The color is linearly interpolated between the connection color and the activity color using `amount` as weight.

> method set_selected(node: Node) -> void

Sets the specified `node` as the one selected.

## Signals

> signal begin_node_move()

Emitted at the beginning of a `GraphElement`'s movement.

> signal connection_drag_ended()

Emitted at the end of a connection drag.

> signal connection_drag_started(from_node: StringName, from_port: int, is_output: bool)

Emitted at the beginning of a connection drag.

> signal connection_from_empty(to_node: StringName, to_port: int, release_position: Vector2)

Emitted when user drags a connection from an input port into the empty space of the graph.

> signal connection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int)

Emitted to the GraphEdit when the connection between the `from_port` of the `from_node` `GraphNode` and the `to_port` of the `to_node` `GraphNode` is attempted to be created.

> signal connection_to_empty(from_node: StringName, from_port: int, release_position: Vector2)

Emitted when user drags a connection from an output port into the empty space of the graph.

> signal copy_nodes_request()

Emitted when this `GraphEdit` captures a `ui_copy` action (`Ctrl + C` by default). In general, this signal indicates that the selected `GraphElement`s should be copied.

> signal cut_nodes_request()

Emitted when this `GraphEdit` captures a `ui_cut` action (`Ctrl + X` by default). In general, this signal indicates that the selected `GraphElement`s should be cut.

> signal delete_nodes_request(nodes: Array[StringName])

Emitted when this `GraphEdit` captures a `ui_graph_delete` action (`Delete` by default).
`nodes` is an array of node names that should be removed. These usually include all selected nodes.

> signal disconnection_request(from_node: StringName, from_port: int, to_node: StringName, to_port: int)

Emitted to the GraphEdit when the connection between `from_port` of `from_node` `GraphNode` and `to_port` of `to_node` `GraphNode` is attempted to be removed.

> signal duplicate_nodes_request()

Emitted when this `GraphEdit` captures a `ui_graph_duplicate` action (`Ctrl + D` by default). In general, this signal indicates that the selected `GraphElement`s should be duplicated.

> signal end_node_move()

Emitted at the end of a `GraphElement`'s movement.

> signal frame_rect_changed(frame: GraphFrame, new_rect: Rect2)

Emitted when the `GraphFrame` `frame` is resized to `new_rect`.

> signal graph_elements_linked_to_frame_request(elements: Array, frame: StringName)

Emitted when one or more `GraphElement`s are dropped onto the `GraphFrame` named `frame`, when they were not previously attached to any other one.
`elements` is an array of `GraphElement`s to be attached.

> signal node_deselected(node: Node)

Emitted when the given `GraphElement` node is deselected.

> signal node_selected(node: Node)

Emitted when the given `GraphElement` node is selected.

> signal paste_nodes_request()

Emitted when this `GraphEdit` captures a `ui_paste` action (`Ctrl + V` by default). In general, this signal indicates that previously copied `GraphElement`s should be pasted.

> signal popup_request(at_position: Vector2)

Emitted when a popup is requested. Happens on right-clicking in the GraphEdit. `at_position` is the position of the mouse pointer when the signal is sent.

> signal scroll_offset_changed(offset: Vector2)

Emitted when the scroll offset is changed by the user. It will not be emitted when changed in code.

## Enumerations

> enum GridPattern

> enum_value GridPattern.GRID_PATTERN_LINES = 0

Draw the grid using solid lines.

> enum_value GridPattern.GRID_PATTERN_DOTS = 1

Draw the grid using dots.

> enum PanningScheme

> enum_value PanningScheme.SCROLL_ZOOMS = 0

`Mouse Wheel` will zoom, `Ctrl + Mouse Wheel` will move the view.

> enum_value PanningScheme.SCROLL_PANS = 1

`Mouse Wheel` will move the view, `Ctrl + Mouse Wheel` will zoom.

## Theme Properties

> theme_property activity : Color ; data=color ; default=Color(1, 1, 1, 1)

Color the connection line is interpolated to based on the activity value of a connection (see `set_connection_activity`).

> theme_property connection_hover_tint_color : Color ; data=color ; default=Color(0, 0, 0, 0.3)

Color which is blended with the connection line when the mouse is hovering over it.

> theme_property connection_rim_color : Color ; data=color ; default=Color(0.1, 0.1, 0.1, 0.6)

Color of the rim around each connection line used for making intersecting lines more distinguishable.

> theme_property connection_valid_target_tint_color : Color ; data=color ; default=Color(1, 1, 1, 0.4)

Color which is blended with the connection line when the currently dragged connection is hovering over a valid target port.

> theme_property grid_major : Color ; data=color ; default=Color(1, 1, 1, 0.2)

Color of major grid lines/dots.

> theme_property grid_minor : Color ; data=color ; default=Color(1, 1, 1, 0.05)

Color of minor grid lines/dots.

> theme_property selection_fill : Color ; data=color ; default=Color(1, 1, 1, 0.3)

The fill color of the selection rectangle.

> theme_property selection_stroke : Color ; data=color ; default=Color(1, 1, 1, 0.8)

The outline color of the selection rectangle.

> theme_property connection_hover_thickness : int ; data=constant ; default=0

Widens the line of a connection when the mouse is hovering over it by a percentage factor. A value of `0` disables the highlight. A value of `100` doubles the line width.

> theme_property port_hotzone_inner_extent : int ; data=constant ; default=22

The horizontal range within which a port can be grabbed (inner side).

> theme_property port_hotzone_outer_extent : int ; data=constant ; default=26

The horizontal range within which a port can be grabbed (outer side).

> theme_property grid_toggle : Texture2D ; data=icon

The icon for the grid toggle button.

> theme_property layout : Texture2D ; data=icon

The icon for the layout button for auto-arranging the graph.

> theme_property minimap_toggle : Texture2D ; data=icon

The icon for the minimap toggle button.

> theme_property snapping_toggle : Texture2D ; data=icon

The icon for the snapping toggle button.

> theme_property zoom_in : Texture2D ; data=icon

The icon for the zoom in button.

> theme_property zoom_out : Texture2D ; data=icon

The icon for the zoom out button.

> theme_property zoom_reset : Texture2D ; data=icon

The icon for the zoom reset button.

> theme_property menu_panel : StyleBox ; data=style

> theme_property panel : StyleBox ; data=style

The background drawn under the grid.

> theme_property panel_focus : StyleBox ; data=style

`StyleBox` used when the `GraphEdit` is focused (when used with assistive apps).
