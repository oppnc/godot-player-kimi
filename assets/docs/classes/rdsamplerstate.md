# RDSamplerState

> class RDSamplerState
> inherits RDSamplerState RefCounted

## Brief

Sampler state (used by `RenderingDevice`).

## Description

This object is used by `RenderingDevice`.

## Properties

> property anisotropy_max : float ; default=1.0 ; setter=set_anisotropy_max ; getter=get_anisotropy_max

Maximum anisotropy that can be used when sampling. Only effective if `use_anisotropy` is `true`. Higher values result in a sharper sampler at oblique angles, at the cost of performance (due to memory bandwidth). This value may be limited by the graphics hardware in use. Most graphics hardware only supports values up to `16.0`.
If `anisotropy_max` is `1.0`, forcibly disables anisotropy even if `use_anisotropy` is `true`.

> property border_color : RenderingDevice.SamplerBorderColor ; default=2 ; setter=set_border_color ; getter=get_border_color

The border color that will be returned when sampling outside the sampler's bounds and the `repeat_u`, `repeat_v` or `repeat_w` modes have repeating disabled.

> property compare_op : RenderingDevice.CompareOperator ; default=7 ; setter=set_compare_op ; getter=get_compare_op

The compare operation to use. Only effective if `enable_compare` is `true`.

> property enable_compare : bool ; default=false ; setter=set_enable_compare ; getter=get_enable_compare

If `true`, returned values will be based on the comparison operation defined in `compare_op`. This is a hardware-based approach and is therefore faster than performing this manually in a shader. For example, compare operations are used for shadow map rendering by comparing depth values from a shadow sampler.

> property lod_bias : float ; default=0.0 ; setter=set_lod_bias ; getter=get_lod_bias

The mipmap LOD bias to use. Positive values will make the sampler blurrier at a given distance, while negative values will make the sampler sharper at a given distance (at the risk of looking grainy). Recommended values are between `-0.5` and `0.0`. Only effective if the sampler has mipmaps available.

> property mag_filter : RenderingDevice.SamplerFilter ; default=0 ; setter=set_mag_filter ; getter=get_mag_filter

The sampler's magnification filter. It is the filtering method used when sampling texels that appear bigger than on-screen pixels.

> property max_lod : float ; default=1e+20 ; setter=set_max_lod ; getter=get_max_lod

The maximum mipmap LOD bias to display (lowest resolution). Only effective if the sampler has mipmaps available.

> property min_filter : RenderingDevice.SamplerFilter ; default=0 ; setter=set_min_filter ; getter=get_min_filter

The sampler's minification filter. It is the filtering method used when sampling texels that appear smaller than on-screen pixels.

> property min_lod : float ; default=0.0 ; setter=set_min_lod ; getter=get_min_lod

The minimum mipmap LOD bias to display (highest resolution). Only effective if the sampler has mipmaps available.

> property mip_filter : RenderingDevice.SamplerFilter ; default=0 ; setter=set_mip_filter ; getter=get_mip_filter

The filtering method to use for mipmaps.

> property repeat_u : RenderingDevice.SamplerRepeatMode ; default=2 ; setter=set_repeat_u ; getter=get_repeat_u

The repeat mode to use along the U axis of UV coordinates. This affects the returned values if sampling outside the UV bounds.

> property repeat_v : RenderingDevice.SamplerRepeatMode ; default=2 ; setter=set_repeat_v ; getter=get_repeat_v

The repeat mode to use along the V axis of UV coordinates. This affects the returned values if sampling outside the UV bounds.

> property repeat_w : RenderingDevice.SamplerRepeatMode ; default=2 ; setter=set_repeat_w ; getter=get_repeat_w

The repeat mode to use along the W axis of UV coordinates. This affects the returned values if sampling outside the UV bounds. Only effective for 3D samplers.

> property unnormalized_uvw : bool ; default=false ; setter=set_unnormalized_uvw ; getter=get_unnormalized_uvw

If `true`, the texture will be sampled with coordinates ranging from 0 to the texture's resolution. Otherwise, the coordinates will be normalized and range from 0 to 1.

> property use_anisotropy : bool ; default=false ; setter=set_use_anisotropy ; getter=get_use_anisotropy

If `true`, perform anisotropic sampling. See `anisotropy_max`.
