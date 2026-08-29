# SpriteBase3D

> class SpriteBase3D
> inherits SpriteBase3D GeometryInstance3D

## Brief

2D sprite node in 3D environment.

## Description

A node that displays 2D texture information in a 3D environment. See also `Sprite3D` where many other properties are defined.

## Properties

> property alpha_antialiasing_edge : float ; default=0.0 ; setter=set_alpha_antialiasing_edge ; getter=get_alpha_antialiasing_edge

Threshold at which antialiasing will be applied on the alpha channel.

> property alpha_antialiasing_mode : BaseMaterial3D.AlphaAntiAliasing ; default=0 ; setter=set_alpha_antialiasing ; getter=get_alpha_antialiasing

The type of alpha antialiasing to apply.

> property alpha_cut : AlphaCutMode ; default=0 ; setter=set_alpha_cut_mode ; getter=get_alpha_cut_mode

The alpha cutting mode to use for the sprite.

> property alpha_hash_scale : float ; default=1.0 ; setter=set_alpha_hash_scale ; getter=get_alpha_hash_scale

The hashing scale for Alpha Hash. Recommended values between `0` and `2`.

> property alpha_scissor_threshold : float ; default=0.5 ; setter=set_alpha_scissor_threshold ; getter=get_alpha_scissor_threshold

Threshold at which the alpha scissor will discard values.

> property axis : Vector3.Axis ; default=2 ; setter=set_axis ; getter=get_axis

The direction in which the front of the texture faces.

> property billboard : BaseMaterial3D.BillboardMode ; default=0 ; setter=set_billboard_mode ; getter=get_billboard_mode

The billboard mode to use for the sprite.
**Note:** When billboarding is enabled and the material also casts shadows, billboards will face **the** camera in the scene when rendering shadows. In scenes with multiple cameras, the intended shadow cannot be determined and this will result in undefined behavior. See [GitHub Pull Request #72638](https://github.com/godotengine/godot/pull/72638) for details.

> property centered : bool ; default=true ; setter=set_centered ; getter=is_centered

If `true`, texture will be centered.

> property double_sided : bool ; default=true ; setter=set_draw_flag ; getter=get_draw_flag

If `true`, texture can be seen from the back as well, if `false`, it is invisible when looking at it from behind.

> property fixed_size : bool ; default=false ; setter=set_draw_flag ; getter=get_draw_flag

If `true`, the texture is rendered at the same size regardless of distance. The texture's size on screen is the same as if the camera was `1.0` units away from the texture's origin, regardless of the actual distance from the camera. The `Camera3D`'s field of view (or `Camera3D.size` when in orthogonal/frustum mode) still affects the size the sprite is drawn at.

> property flip_h : bool ; default=false ; setter=set_flip_h ; getter=is_flipped_h

If `true`, texture is flipped horizontally.

> property flip_v : bool ; default=false ; setter=set_flip_v ; getter=is_flipped_v

If `true`, texture is flipped vertically.

> property modulate : Color ; default=Color(1, 1, 1, 1) ; setter=set_modulate ; getter=get_modulate

A color value used to *multiply* the texture's colors. Can be used for mood-coloring or to simulate the color of ambient light.
**Note:** Unlike `CanvasItem.modulate` for 2D, colors with values above `1.0` (overbright) are not supported.
**Note:** If a `GeometryInstance3D.material_override` is defined on the `SpriteBase3D`, the material override must be configured to take vertex colors into account for albedo. Otherwise, the color defined in `modulate` will be ignored. For a `BaseMaterial3D`, `BaseMaterial3D.vertex_color_use_as_albedo` must be `true`. For a `ShaderMaterial`, `ALBEDO *= COLOR.rgb;` must be inserted in the shader's `fragment()` function.

> property no_depth_test : bool ; default=false ; setter=set_draw_flag ; getter=get_draw_flag

If `true`, depth testing is disabled and the object will be drawn in render order.

> property offset : Vector2 ; default=Vector2(0, 0) ; setter=set_offset ; getter=get_offset

The texture's drawing offset.
**Note:** When you increase `offset`.y in Sprite3D, the sprite moves upward in world space (i.e., +Y is up).

> property pixel_size : float ; default=0.01 ; setter=set_pixel_size ; getter=get_pixel_size

The size of one pixel's width on the sprite to scale it in 3D.

> property render_priority : int ; default=0 ; setter=set_render_priority ; getter=get_render_priority

Sets the render priority for the sprite. Higher priority objects will be sorted in front of lower priority objects.
**Note:** This only applies if `alpha_cut` is set to `ALPHA_CUT_DISABLED` (default value).
**Note:** This only applies to sorting of transparent objects. This will not impact how transparent objects are sorted relative to opaque objects. This is because opaque objects are not sorted, while transparent objects are sorted from back to front (subject to priority).

> property shaded : bool ; default=false ; setter=set_draw_flag ; getter=get_draw_flag

If `true`, the `Light3D` in the `Environment` has effects on the sprite.

> property texture_filter : BaseMaterial3D.TextureFilter ; default=3 ; setter=set_texture_filter ; getter=get_texture_filter

Filter flags for the texture.
**Note:** Linear filtering may cause artifacts around the edges, which are especially noticeable on opaque textures. To prevent this, use textures with transparent or identical colors around the edges.

> property transparent : bool ; default=true ; setter=set_draw_flag ; getter=get_draw_flag

If `true`, the texture's transparency and the opacity are used to make those parts of the sprite invisible.

## Methods

> method generate_triangle_mesh() -> TriangleMesh ; qualifiers=const

Returns a `TriangleMesh` with the sprite's vertices following its current configuration (such as its `axis` and `pixel_size`).

> method get_draw_flag(flag: DrawFlags) -> bool ; qualifiers=const

Returns the value of the specified flag.

> method get_item_rect() -> Rect2 ; qualifiers=const

Returns the rectangle representing this sprite.

> method set_draw_flag(flag: DrawFlags, enabled: bool) -> void

If `true`, the specified flag will be enabled.

## Enumerations

> enum AlphaCutMode

> enum_value AlphaCutMode.ALPHA_CUT_DISABLED = 0

This mode performs standard alpha blending. It can display translucent areas, but transparency sorting issues may be visible when multiple transparent materials are overlapping.

> enum_value AlphaCutMode.ALPHA_CUT_DISCARD = 1

This mode only allows fully transparent or fully opaque pixels. Harsh edges will be visible unless some form of screen-space antialiasing is enabled (see `ProjectSettings.rendering/anti_aliasing/quality/screen_space_aa`). On the bright side, this mode doesn't suffer from transparency sorting issues when multiple transparent materials are overlapping. This mode is also known as *alpha testing* or *1-bit transparency*.

> enum_value AlphaCutMode.ALPHA_CUT_OPAQUE_PREPASS = 2

This mode draws fully opaque pixels in the depth prepass. This is slower than `ALPHA_CUT_DISABLED` or `ALPHA_CUT_DISCARD`, but it allows displaying translucent areas and smooth edges while using proper sorting.

> enum_value AlphaCutMode.ALPHA_CUT_HASH = 3

This mode draws cuts off all values below a spatially-deterministic threshold, the rest will remain opaque.

> enum DrawFlags

> enum_value DrawFlags.FLAG_TRANSPARENT = 0

If set, the texture's transparency and the opacity are used to make those parts of the sprite invisible.

> enum_value DrawFlags.FLAG_SHADED = 1

If set, lights in the environment affect the sprite.

> enum_value DrawFlags.FLAG_DOUBLE_SIDED = 2

If set, texture can be seen from the back as well. If not, the texture is invisible when looking at it from behind.

> enum_value DrawFlags.FLAG_DISABLE_DEPTH_TEST = 3

Disables the depth test, so this object is drawn on top of all others. However, objects drawn after it in the draw order may cover it.

> enum_value DrawFlags.FLAG_FIXED_SIZE = 4

Label is scaled by depth so that it always appears the same size on screen.

> enum_value DrawFlags.FLAG_MAX = 5

Represents the size of the `DrawFlags` enum.
