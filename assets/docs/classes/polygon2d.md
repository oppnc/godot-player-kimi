# Polygon2D

> class Polygon2D
> inherits Polygon2D Node2D

## Brief

A 2D polygon.

## Description

A Polygon2D is defined by a set of points. Each point is connected to the next, with the final point being connected to the first, resulting in a closed polygon. Polygon2Ds can be filled with color (solid or gradient) or filled with a given texture.

## Properties

> property antialiased : bool ; default=false ; setter=set_antialiased ; getter=get_antialiased

If `true`, polygon edges will be anti-aliased.

> property color : Color ; default=Color(1, 1, 1, 1) ; setter=set_color ; getter=get_color

The polygon's fill color. If `texture` is set, it will be multiplied by this color. It will also be the default color for vertices not set in `vertex_colors`.

> property internal_vertex_count : int ; default=0 ; setter=set_internal_vertex_count ; getter=get_internal_vertex_count

Number of internal vertices, used for UV mapping.

> property invert_border : float ; default=100.0 ; setter=set_invert_border ; getter=get_invert_border

Added padding applied to the bounding box when `invert_enabled` is set to `true`. Setting this value too small may result in a "Bad Polygon" error.

> property invert_enabled : bool ; default=false ; setter=set_invert_enabled ; getter=get_invert_enabled

If `true`, the polygon will be inverted, containing the area outside the defined points and extending to the `invert_border`.

> property offset : Vector2 ; default=Vector2(0, 0) ; setter=set_offset ; getter=get_offset

The offset applied to each vertex.

> property polygon : PackedVector2Array ; default=PackedVector2Array() ; setter=set_polygon ; getter=get_polygon

The polygon's list of vertices. The final point will be connected to the first.

> property polygons : Array ; default=[] ; setter=set_polygons ; getter=get_polygons

The list of polygons, in case more than one is being represented. Every individual polygon is stored as a `PackedInt32Array` where each `int` is an index to a point in `polygon`. If empty, this property will be ignored, and the resulting single polygon will be composed of all points in `polygon`, using the order they are stored in.

> property skeleton : NodePath ; default=NodePath("") ; setter=set_skeleton ; getter=get_skeleton

Path to a `Skeleton2D` node used for skeleton-based deformations of this polygon. If empty or invalid, skeletal deformations will not be used.

> property texture : Texture2D ; setter=set_texture ; getter=get_texture

The polygon's fill texture. Use `uv` to set texture coordinates.

> property texture_offset : Vector2 ; default=Vector2(0, 0) ; setter=set_texture_offset ; getter=get_texture_offset

Amount to offset the polygon's `texture`. If set to `Vector2(0, 0)`, the texture's origin (its top-left corner) will be placed at the polygon's position.

> property texture_rotation : float ; default=0.0 ; setter=set_texture_rotation ; getter=get_texture_rotation

The texture's rotation in radians.

> property texture_scale : Vector2 ; default=Vector2(1, 1) ; setter=set_texture_scale ; getter=get_texture_scale

Amount to multiply the `uv` coordinates when using `texture`. Larger values make the texture smaller, and vice versa.

> property uv : PackedVector2Array ; default=PackedVector2Array() ; setter=set_uv ; getter=get_uv

Texture coordinates for each vertex of the polygon. There should be one UV value per polygon vertex. If there are fewer, undefined vertices will use `Vector2(0, 0)`.

> property vertex_colors : PackedColorArray ; default=PackedColorArray() ; setter=set_vertex_colors ; getter=get_vertex_colors

Color for each vertex. Colors are interpolated between vertices, resulting in smooth gradients. There should be one per polygon vertex. If there are fewer, undefined vertices will use `color`.

## Methods

> method add_bone(path: NodePath, weights: PackedFloat32Array) -> void

Adds a bone with the specified `path` and `weights`.

> method clear_bones() -> void

Removes all bones from this `Polygon2D`.

> method erase_bone(index: int) -> void

Removes the specified bone from this `Polygon2D`.

> method get_bone_count() -> int ; qualifiers=const

Returns the number of bones in this `Polygon2D`.

> method get_bone_path(index: int) -> NodePath ; qualifiers=const

Returns the path to the node associated with the specified bone.

> method get_bone_weights(index: int) -> PackedFloat32Array ; qualifiers=const

Returns the weight values of the specified bone.

> method set_bone_path(index: int, path: NodePath) -> void

Sets the path to the node associated with the specified bone.

> method set_bone_weights(index: int, weights: PackedFloat32Array) -> void

Sets the weight values for the specified bone.
