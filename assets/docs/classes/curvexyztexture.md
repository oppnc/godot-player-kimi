# CurveXYZTexture

> class CurveXYZTexture
> inherits CurveXYZTexture Texture2D

## Brief

A 1D texture where the red, green, and blue color channels correspond to points on 3 curves.

## Description

A 1D texture where the red, green, and blue color channels correspond to points on 3 unit `Curve` resources. Compared to using separate `CurveTexture`s, this further simplifies the task of saving curves as image files.
If you only need to store one curve within a single texture, use `CurveTexture` instead. See also `GradientTexture1D` and `GradientTexture2D`.

## Properties

> property curve_x : Curve ; setter=set_curve_x ; getter=get_curve_x

The `Curve` that is rendered onto the texture's red channel. Should be a unit `Curve`.

> property curve_y : Curve ; setter=set_curve_y ; getter=get_curve_y

The `Curve` that is rendered onto the texture's green channel. Should be a unit `Curve`.

> property curve_z : Curve ; setter=set_curve_z ; getter=get_curve_z

The `Curve` that is rendered onto the texture's blue channel. Should be a unit `Curve`.

> property resource_local_to_scene : bool ; default=false ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

> property width : int ; default=256 ; setter=set_width ; getter=get_width

The width of the texture (in pixels). Higher values make it possible to represent high-frequency data better (such as sudden direction changes), at the cost of increased generation time and memory usage.
