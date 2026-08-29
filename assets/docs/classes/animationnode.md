# AnimationNode

> class AnimationNode
> inherits AnimationNode Resource

## Brief

Base class for `AnimationTree` nodes. Not related to scene nodes.

## Description

Base resource for `AnimationTree` nodes. In general, it's not used directly, but you can create custom ones with custom blending formulas.
Inherit this when creating animation nodes mainly for use in `AnimationNodeBlendTree`, otherwise `AnimationRootNode` should be used instead.
You can access the time information as read-only parameter which is processed and stored in the previous frame for all nodes except `AnimationNodeOutput`.
**Note:** If multiple inputs exist in the `AnimationNode`, which time information takes precedence depends on the type of `AnimationNode`.

```text
        var current_length = $AnimationTree["parameters/AnimationNodeName/current_length"]
        var current_position = $AnimationTree["parameters/AnimationNodeName/current_position"]
        var current_delta = $AnimationTree["parameters/AnimationNodeName/current_delta"]

```

## Properties

> property filter_enabled : bool ; setter=set_filter_enabled ; getter=is_filter_enabled

If `true`, filtering is enabled.

## Methods

> method _get_caption() -> String ; qualifiers=virtual const

When inheriting from `AnimationRootNode`, implement this virtual method to override the text caption for this animation node.

> method _get_child_by_name(name: StringName) -> AnimationNode ; qualifiers=virtual const

When inheriting from `AnimationRootNode`, implement this virtual method to return a child animation node by its `name`.

> method _get_child_nodes() -> Dictionary ; qualifiers=virtual const

When inheriting from `AnimationRootNode`, implement this virtual method to return all child animation nodes in order as a `name: node` dictionary.

> method _get_parameter_default_value(parameter: StringName) -> Variant ; qualifiers=virtual const

When inheriting from `AnimationRootNode`, implement this virtual method to return the default value of a `parameter`. Parameters are custom local memory used for your animation nodes, given a resource can be reused in multiple trees.

> method _get_parameter_list() -> Array ; qualifiers=virtual const

When inheriting from `AnimationRootNode`, implement this virtual method to return a list of the properties on this animation node. Parameters are custom local memory used for your animation nodes, given a resource can be reused in multiple trees. Format is similar to `Object.get_property_list`.

> method _has_filter() -> bool ; qualifiers=virtual const

When inheriting from `AnimationRootNode`, implement this virtual method to return whether the blend tree editor should display filter editing on this animation node.

> method _is_parameter_read_only(parameter: StringName) -> bool ; qualifiers=virtual const

When inheriting from `AnimationRootNode`, implement this virtual method to return whether the `parameter` is read-only. Parameters are custom local memory used for your animation nodes, given a resource can be reused in multiple trees.

> method _process(time: float, seek: bool, is_external_seeking: bool, test_only: bool) -> float ; qualifiers=virtual ; deprecated=Currently this is mostly useless as there is a lack of many APIs to extend AnimationNode by GDScript. It is planned that a more flexible API using structures will be provided in the future.

When inheriting from `AnimationRootNode`, implement this virtual method to run some code when this animation node is processed. The `time` parameter is a relative delta, unless `seek` is `true`, in which case it is absolute.
Here, call the `blend_input`, `blend_node` or `blend_animation` functions. You can also use `get_parameter` and `set_parameter` to modify local memory.
This function should return the delta.

> method add_input(name: String) -> bool

Adds an input to the animation node. This is only useful for animation nodes created for use in an `AnimationNodeBlendTree`. If the addition fails, returns `false`.

> method blend_animation(animation: StringName, time: float, delta: float, seeked: bool, is_external_seeking: bool, blend: float, looped_flag: Animation.LoopedFlag = 0) -> void

Blends an animation by `blend` amount (name must be valid in the linked `AnimationPlayer`). A `time` and `delta` may be passed, as well as whether `seeked` happened.
A `looped_flag` is used by internal processing immediately after the loop.

> method blend_input(input_index: int, time: float, seek: bool, is_external_seeking: bool, blend: float, filter: FilterAction = 0, sync: bool = true, test_only: bool = false) -> float

Blends an input. This is only useful for animation nodes created for an `AnimationNodeBlendTree`. The `time` parameter is a relative delta, unless `seek` is `true`, in which case it is absolute. A filter mode may be optionally passed.

> method blend_node(name: StringName, node: AnimationNode, time: float, seek: bool, is_external_seeking: bool, blend: float, filter: FilterAction = 0, sync: bool = true, test_only: bool = false) -> float

Blend another animation node (in case this animation node contains child animation nodes). This function is only useful if you inherit from `AnimationRootNode` instead, otherwise editors will not display your animation node for addition.

> method find_input(name: String) -> int ; qualifiers=const

Returns the input index which corresponds to `name`. If not found, returns `-1`.

> method get_input_count() -> int ; qualifiers=const

Amount of inputs in this animation node, only useful for animation nodes that go into `AnimationNodeBlendTree`.

> method get_input_name(input: int) -> String ; qualifiers=const

Gets the name of an input by index.

> method get_parameter(name: StringName) -> Variant ; qualifiers=const

Gets the value of a parameter. Parameters are custom local memory used for your animation nodes, given a resource can be reused in multiple trees.

> method get_processing_animation_tree_instance_id() -> int ; qualifiers=const

Returns the object id of the `AnimationTree` that owns this node.
**Note:** This method should only be called from within the `AnimationNodeExtension._process_animation_node` method, and will return an invalid id otherwise.

> method is_path_filtered(path: NodePath) -> bool ; qualifiers=const

Returns `true` if the given path is filtered.

> method is_process_testing() -> bool ; qualifiers=const

Returns `true` if this animation node is being processed in test-only mode.

> method remove_input(index: int) -> void

Removes an input, call this only when inactive.

> method set_filter_path(path: NodePath, enable: bool) -> void

Adds or removes a path for the filter.

> method set_input_name(input: int, name: String) -> bool

Sets the name of the input at the given `input` index. If the setting fails, returns `false`.

> method set_parameter(name: StringName, value: Variant) -> void

Sets a custom parameter. These are used as local memory, because resources can be reused across the tree or scenes.

## Signals

> signal animation_node_removed(object_id: int, node_name: String)

Emitted by nodes that inherit from this class and that have an internal tree when one of their animation nodes removes. The animation nodes that emit this signal are `AnimationNodeBlendSpace1D`, `AnimationNodeBlendSpace2D`, `AnimationNodeStateMachine`, and `AnimationNodeBlendTree`.

> signal animation_node_renamed(object_id: int, old_name: String, new_name: String)

Emitted by nodes that inherit from this class and that have an internal tree when one of their animation node names changes. The animation nodes that emit this signal are `AnimationNodeBlendSpace1D`, `AnimationNodeBlendSpace2D`, `AnimationNodeStateMachine`, and `AnimationNodeBlendTree`.

> signal node_updated(object_id: int) ; experimental=This signal may be changed or removed in future versions.

Emitted by `AnimationNodeAnimation` when its `AnimationNodeAnimation.animation` resource is changed, or by `AnimationNodeBlendTree` when its connections change.

> signal tree_changed()

Emitted by nodes that inherit from this class and that have an internal tree when one of their animation nodes changes. The animation nodes that emit this signal are `AnimationNodeBlendSpace1D`, `AnimationNodeBlendSpace2D`, `AnimationNodeStateMachine`, `AnimationNodeBlendTree` and `AnimationNodeTransition`.

## Enumerations

> enum FilterAction

> enum_value FilterAction.FILTER_IGNORE = 0

Do not use filtering.

> enum_value FilterAction.FILTER_PASS = 1

Paths matching the filter will be allowed to pass.

> enum_value FilterAction.FILTER_STOP = 2

Paths matching the filter will be discarded.

> enum_value FilterAction.FILTER_BLEND = 3

Paths matching the filter will be blended (by the blend value).

## Tutorials
- [Using AnimationTree]($DOCS_URL/tutorials/animation/animation_tree.html)
