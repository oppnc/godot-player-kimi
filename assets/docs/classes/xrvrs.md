# XRVRS

> class XRVRS
> inherits XRVRS Object

## Brief

Helper class for XR interfaces that generates VRS images.

## Description

This class is used by various XR interfaces to generate VRS textures that can be used to speed up rendering.

## Properties

> property vrs_min_radius : float ; default=20.0 ; setter=set_vrs_min_radius ; getter=get_vrs_min_radius

The minimum radius around the focal point where full quality is guaranteed if VRS is used as a percentage of screen size.

> property vrs_render_region : Rect2i ; default=Rect2i(0, 0, 0, 0) ; setter=set_vrs_render_region ; getter=get_vrs_render_region

The render region that the VRS texture will be scaled to when generated.

> property vrs_strength : float ; default=1.0 ; setter=set_vrs_strength ; getter=get_vrs_strength

The strength used to calculate the VRS density map. The greater this value, the more noticeable VRS is.

## Methods

> method make_vrs_texture(target_size: Vector2, eye_foci: PackedVector2Array) -> RID

Generates the VRS texture based on a render `target_size` adjusted by our VRS tile size. For each eyes focal point passed in `eye_foci` a layer is created. Focal point should be in NDC.
The result will be cached, requesting a VRS texture with unchanged parameters and settings will return the cached RID.
