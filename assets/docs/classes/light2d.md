# Light2D

> class Light2D
> inherits Light2D Node2D

## Brief

Casts light in a 2D environment.

## Description

Casts light in a 2D environment. A light is defined as a color, an energy value, a mode (see constants), and various other parameters (range and shadows-related).

## Properties

> property blend_mode : BlendMode ; default=0 ; setter=set_blend_mode ; getter=get_blend_mode

The Light2D's blend mode.

> property color : Color ; default=Color(1, 1, 1, 1) ; setter=set_color ; getter=get_color

The Light2D's `Color`.

> property editor_only : bool ; default=false ; setter=set_editor_only ; getter=is_editor_only

If `true`, Light2D will only appear when editing the scene.

> property enabled : bool ; default=true ; setter=set_enabled ; getter=is_enabled

If `true`, Light2D will emit light.

> property energy : float ; default=1.0 ; setter=set_energy ; getter=get_energy

The Light2D's energy value. The larger the value, the stronger the light.

> property range_item_cull_mask : int ; default=1 ; setter=set_item_cull_mask ; getter=get_item_cull_mask

The layer mask. Only objects with a matching `CanvasItem.light_mask` will be affected by the Light2D. See also `shadow_item_cull_mask`, which affects which objects can cast shadows.
**Note:** `range_item_cull_mask` is ignored by `DirectionalLight2D`, which will always light a 2D node regardless of the 2D node's `CanvasItem.light_mask`.

> property range_layer_max : int ; default=0 ; setter=set_layer_range_max ; getter=get_layer_range_max

Maximum layer value of objects that are affected by the Light2D.

> property range_layer_min : int ; default=0 ; setter=set_layer_range_min ; getter=get_layer_range_min

Minimum layer value of objects that are affected by the Light2D.

> property range_z_max : int ; default=1024 ; setter=set_z_range_max ; getter=get_z_range_max

Maximum `z` value of objects that are affected by the Light2D.

> property range_z_min : int ; default=-1024 ; setter=set_z_range_min ; getter=get_z_range_min

Minimum `z` value of objects that are affected by the Light2D.

> property shadow_color : Color ; default=Color(0, 0, 0, 0) ; setter=set_shadow_color ; getter=get_shadow_color

`Color` of shadows cast by the Light2D.

> property shadow_enabled : bool ; default=false ; setter=set_shadow_enabled ; getter=is_shadow_enabled

If `true`, the Light2D will cast shadows.

> property shadow_filter : ShadowFilter ; default=0 ; setter=set_shadow_filter ; getter=get_shadow_filter

Shadow filter type.

> property shadow_filter_smooth : float ; default=0.0 ; setter=set_shadow_smooth ; getter=get_shadow_smooth

Smoothing value for shadows. Higher values will result in softer shadows, at the cost of visible streaks that can appear in shadow rendering. `shadow_filter_smooth` only has an effect if `shadow_filter` is `SHADOW_FILTER_PCF5` or `SHADOW_FILTER_PCF13`.

> property shadow_item_cull_mask : int ; default=1 ; setter=set_item_shadow_cull_mask ; getter=get_item_shadow_cull_mask

The shadow mask. Used with `LightOccluder2D` to cast shadows. Only occluders with a matching `CanvasItem.light_mask` will cast shadows. See also `range_item_cull_mask`, which affects which objects can *receive* the light.

## Methods

> method get_height() -> float ; qualifiers=const

Returns the light's height, which is used in 2D normal mapping. See `PointLight2D.height` and `DirectionalLight2D.height`.

> method set_height(height: float) -> void

Sets the light's height, which is used in 2D normal mapping. See `PointLight2D.height` and `DirectionalLight2D.height`.

## Enumerations

> enum BlendMode

> enum_value BlendMode.BLEND_MODE_ADD = 0

Adds the value of pixels corresponding to the Light2D to the values of pixels under it. This is the common behavior of a light.

> enum_value BlendMode.BLEND_MODE_SUB = 1

Subtracts the value of pixels corresponding to the Light2D to the values of pixels under it, resulting in inversed light effect.

> enum_value BlendMode.BLEND_MODE_MIX = 2

Mix the value of pixels corresponding to the Light2D to the values of pixels under it by linear interpolation.

> enum ShadowFilter

> enum_value ShadowFilter.SHADOW_FILTER_NONE = 0

No filter applies to the shadow map. This provides hard shadow edges and is the fastest to render. See `shadow_filter`.

> enum_value ShadowFilter.SHADOW_FILTER_PCF5 = 1

Percentage closer filtering (5 samples) applies to the shadow map. This is slower compared to hard shadow rendering. See `shadow_filter`.

> enum_value ShadowFilter.SHADOW_FILTER_PCF13 = 2

Percentage closer filtering (13 samples) applies to the shadow map. This is the slowest shadow filtering mode, and should be used sparingly. See `shadow_filter`.

## Tutorials
- [2D lights and shadows]($DOCS_URL/tutorials/2d/2d_lights_and_shadows.html)
