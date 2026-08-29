# CanvasLayer

> class CanvasLayer
> inherits CanvasLayer Node

## Brief

A node used for independent rendering of objects within a 2D scene.

## Description

`CanvasItem`-derived nodes that are direct or indirect children of a `CanvasLayer` will be drawn in that layer. The layer is a numeric index that defines the draw order. The default 2D scene renders with index `0`, so a `CanvasLayer` with index `-1` will be drawn below, and a `CanvasLayer` with index `1` will be drawn above. This order will hold regardless of the `CanvasItem.z_index` of the nodes within each layer.
`CanvasLayer`s can be hidden and they can also optionally follow the viewport. This makes them useful for HUDs like health bar overlays (on layers `1` and higher) or backgrounds (on layers `-1` and lower).
**Note:** Embedded `Window`s are placed on layer `1024`. `CanvasItem`s on layers `1025` and higher appear in front of embedded windows.
**Note:** Each `CanvasLayer` is drawn on one specific `Viewport` and cannot be shared between multiple `Viewport`s, see `custom_viewport`. When using multiple `Viewport`s, for example in a split-screen game, you need to create an individual `CanvasLayer` for each `Viewport` you want it to be drawn on.

## Properties

> property custom_viewport : Node ; setter=set_custom_viewport ; getter=get_custom_viewport

The custom `Viewport` node assigned to the `CanvasLayer`. If `null`, uses the default viewport instead.

> property follow_viewport_enabled : bool ; default=false ; setter=set_follow_viewport ; getter=is_following_viewport

If enabled, the `CanvasLayer` maintains its position in world space. If disabled, the `CanvasLayer` stays in a fixed position on the screen.
Together with `follow_viewport_scale`, this can be used for a pseudo-3D effect.

> property follow_viewport_scale : float ; default=1.0 ; setter=set_follow_viewport_scale ; getter=get_follow_viewport_scale

Scales the layer when using `follow_viewport_enabled`. Layers moving into the foreground should have increasing scales, while layers moving into the background should have decreasing scales.

> property layer : int ; default=1 ; setter=set_layer ; getter=get_layer

Layer index for draw order. Lower values are drawn behind higher values.
**Note:** If multiple CanvasLayers have the same layer index, `CanvasItem` children of one CanvasLayer are drawn behind the `CanvasItem` children of the other CanvasLayer. Which CanvasLayer is drawn in front is non-deterministic.
**Note:** The layer index should be between `RenderingServer.CANVAS_LAYER_MIN` and `RenderingServer.CANVAS_LAYER_MAX` (inclusive). Any other value will wrap around.

> property offset : Vector2 ; default=Vector2(0, 0) ; setter=set_offset ; getter=get_offset

The layer's base offset.

> property rotation : float ; default=0.0 ; setter=set_rotation ; getter=get_rotation

The layer's rotation in radians.

> property scale : Vector2 ; default=Vector2(1, 1) ; setter=set_scale ; getter=get_scale

The layer's scale.

> property transform : Transform2D ; default=Transform2D(1, 0, 0, 1, 0, 0) ; setter=set_transform ; getter=get_transform

The layer's transform.

> property visible : bool ; default=true ; setter=set_visible ; getter=is_visible

If `false`, any `CanvasItem` under this `CanvasLayer` will be hidden.
Unlike `CanvasItem.visible`, visibility of a `CanvasLayer` isn't propagated to underlying layers.

## Methods

> method get_canvas() -> RID ; qualifiers=const

Returns the RID of the canvas used by this layer.

> method get_final_transform() -> Transform2D ; qualifiers=const

Returns the transform from the `CanvasLayer`s coordinate system to the `Viewport`s coordinate system.

> method hide() -> void

Hides any `CanvasItem` under this `CanvasLayer`. This is equivalent to setting `visible` to `false`.

> method show() -> void

Shows any `CanvasItem` under this `CanvasLayer`. This is equivalent to setting `visible` to `true`.

## Signals

> signal visibility_changed()

Emitted when visibility of the layer is changed. See `visible`.

## Tutorials
- [Viewport and canvas transforms]($DOCS_URL/tutorials/2d/2d_transforms.html)
- [Canvas layers]($DOCS_URL/tutorials/2d/canvas_layers.html)
- [2D Dodge The Creeps Demo](https://godotengine.org/asset-library/asset/2712)
