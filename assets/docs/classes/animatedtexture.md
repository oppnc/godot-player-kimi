# AnimatedTexture

> class AnimatedTexture ; deprecated=This class does not work properly in current versions and may be removed in the future. There is currently no equivalent workaround.
> inherits AnimatedTexture Texture2D

## Brief

Proxy texture for simple frame-based animations.

## Description

`AnimatedTexture` is a resource format for frame-based animations, where multiple textures can be chained automatically with a predefined delay for each frame. Unlike `AnimationPlayer` or `AnimatedSprite2D`, it isn't a `Node`, but has the advantage of being usable anywhere a `Texture2D` resource can be used, e.g. in a `TileSet`.
The playback of the animation is controlled by the `speed_scale` property, as well as each frame's duration (see `set_frame_duration`). The animation loops, i.e. it will restart at frame 0 automatically after playing the last frame.
`AnimatedTexture` currently requires all frame textures to have the same size, otherwise the bigger ones will be cropped to match the smallest one.
**Note:** AnimatedTexture doesn't support using `AtlasTexture`s. Each frame needs to be a separate `Texture2D`.
**Warning:** The current implementation is not efficient for the modern renderers.

## Properties

> property current_frame : int ; setter=set_current_frame ; getter=get_current_frame

Sets the currently visible frame of the texture. Setting this frame while playing resets the current frame time, so the newly selected frame plays for its whole configured frame duration.

> property frames : int ; default=1 ; setter=set_frames ; getter=get_frames

Number of frames to use in the animation. While you can create the frames independently with `set_frame_texture`, you need to set this value for the animation to take new frames into account. The maximum number of frames is `MAX_FRAMES`.

> property one_shot : bool ; default=false ; setter=set_one_shot ; getter=get_one_shot

If `true`, the animation will only play once and will not loop back to the first frame after reaching the end. Note that reaching the end will not set `pause` to `true`.

> property pause : bool ; default=false ; setter=set_pause ; getter=get_pause

If `true`, the animation will pause where it currently is (i.e. at `current_frame`). The animation will continue from where it was paused when changing this property to `false`.

> property resource_local_to_scene : bool ; default=false ; setter=set_local_to_scene ; getter=is_local_to_scene ; overrides=Resource

> property speed_scale : float ; default=1.0 ; setter=set_speed_scale ; getter=get_speed_scale

The animation speed is multiplied by this value. If set to a negative value, the animation is played in reverse.

## Methods

> method get_frame_duration(frame: int) -> float ; qualifiers=const

Returns the given `frame`'s duration, in seconds.

> method get_frame_texture(frame: int) -> Texture2D ; qualifiers=const

Returns the given frame's `Texture2D`.

> method set_frame_duration(frame: int, duration: float) -> void

Sets the duration of any given `frame`. The final duration is affected by the `speed_scale`. If set to `0`, the frame is skipped during playback.

> method set_frame_texture(frame: int, texture: Texture2D) -> void

Assigns a `Texture2D` to the given frame. Frame IDs start at 0, so the first frame has ID 0, and the last frame of the animation has ID `frames` - 1.
You can define any number of textures up to `MAX_FRAMES`, but keep in mind that only frames from 0 to `frames` - 1 will be part of the animation.

## Constants

> constant MAX_FRAMES = 256

The maximum number of frames supported by `AnimatedTexture`. If you need more frames in your animation, use `AnimationPlayer` or `AnimatedSprite2D`.
