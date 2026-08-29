# AnimationNodeBlendTree

> class AnimationNodeBlendTree
> inherits AnimationNodeBlendTree AnimationRootNode

## Brief

A sub-tree of many type `AnimationNode`s used for complex animations. Used by `AnimationTree`.

## Description

This animation node may contain a sub-tree of any other type animation nodes, such as `AnimationNodeTransition`, `AnimationNodeBlend2`, `AnimationNodeBlend3`, `AnimationNodeOneShot`, etc. This is one of the most commonly used animation node roots.
An `AnimationNodeOutput` node named `output` is created by default.

## Properties

> property graph_offset : Vector2 ; default=Vector2(0, 0) ; setter=set_graph_offset ; getter=get_graph_offset

The global offset of all sub animation nodes.

## Methods

> method add_node(name: StringName, node: AnimationNode, position: Vector2 = Vector2(0, 0)) -> void

Adds an `AnimationNode` at the given `position`. The `name` is used to identify the created sub animation node later.

> method connect_node(input_node: StringName, input_index: int, output_node: StringName) -> void

Connects the output of an `AnimationNode` as input for another `AnimationNode`, at the input port specified by `input_index`.

> method disconnect_node(input_node: StringName, input_index: int) -> void

Disconnects the animation node connected to the specified input.

> method get_node(name: StringName) -> AnimationNode ; qualifiers=const

Returns the sub animation node with the specified `name`.

> method get_node_list() -> Array[StringName] ; qualifiers=const

Returns a list containing the names of all sub animation nodes in this blend tree.

> method get_node_position(name: StringName) -> Vector2 ; qualifiers=const

Returns the position of the sub animation node with the specified `name`.

> method has_node(name: StringName) -> bool ; qualifiers=const

Returns `true` if a sub animation node with specified `name` exists.

> method remove_node(name: StringName) -> void

Removes a sub animation node.

> method rename_node(name: StringName, new_name: StringName) -> void

Changes the name of a sub animation node.

> method set_node_position(name: StringName, position: Vector2) -> void

Modifies the position of a sub animation node.

## Signals

> signal node_changed(node_name: StringName)

Emitted when the input port information is changed.

## Constants

> constant CONNECTION_OK = 0

The connection was successful.

> constant CONNECTION_ERROR_NO_INPUT = 1

The input node is `null`.

> constant CONNECTION_ERROR_NO_INPUT_INDEX = 2

The specified input port is out of range.

> constant CONNECTION_ERROR_NO_OUTPUT = 3

The output node is `null`.

> constant CONNECTION_ERROR_SAME_NODE = 4

Input and output nodes are the same.

> constant CONNECTION_ERROR_CONNECTION_EXISTS = 5

The specified connection already exists.

## Tutorials
- [Using AnimationTree]($DOCS_URL/tutorials/animation/animation_tree.html)
