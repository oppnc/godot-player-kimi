# InputEventScreenDrag

> class InputEventScreenDrag
> inherits InputEventScreenDrag InputEventFromWindow

## Brief

Represents a screen drag event.

## Description

Stores information about screen drag events. See `Node._input`.

## Properties

> property index : int ; default=0 ; setter=set_index ; getter=get_index

The drag event index in the case of a multi-drag event.

> property pen_inverted : bool ; default=false ; setter=set_pen_inverted ; getter=get_pen_inverted

Returns `true` when using the eraser end of a stylus pen.

> property position : Vector2 ; default=Vector2(0, 0) ; setter=set_position ; getter=get_position

The drag position in the viewport the node is in, using the coordinate system of this viewport.

> property pressure : float ; default=0.0 ; setter=set_pressure ; getter=get_pressure

Represents the pressure the user puts on the pen. Ranges from `0.0` to `1.0`.

> property relative : Vector2 ; default=Vector2(0, 0) ; setter=set_relative ; getter=get_relative

The drag position relative to the previous position (position at the last frame).
**Note:** `relative` is automatically scaled according to the content scale factor, which is defined by the project's stretch mode settings. This means touch sensitivity will appear different depending on resolution when using `relative` in a script that handles touch aiming. To avoid this, use `screen_relative` instead.

> property screen_relative : Vector2 ; default=Vector2(0, 0) ; setter=set_screen_relative ; getter=get_screen_relative

The unscaled drag position relative to the previous position in screen coordinates (position at the last frame). This position is *not* scaled according to the content scale factor or calls to `InputEvent.xformed_by`. This should be preferred over `relative` for touch aiming regardless of the project's stretch mode.

> property screen_velocity : Vector2 ; default=Vector2(0, 0) ; setter=set_screen_velocity ; getter=get_screen_velocity

The unscaled drag velocity in pixels per second in screen coordinates. This velocity is *not* scaled according to the content scale factor or calls to `InputEvent.xformed_by`. This should be preferred over `velocity` for touch aiming regardless of the project's stretch mode.

> property tilt : Vector2 ; default=Vector2(0, 0) ; setter=set_tilt ; getter=get_tilt

Represents the angles of tilt of the pen. Positive X-coordinate value indicates a tilt to the right. Positive Y-coordinate value indicates a tilt toward the user. Ranges from `-1.0` to `1.0` for both axes.

> property velocity : Vector2 ; default=Vector2(0, 0) ; setter=set_velocity ; getter=get_velocity

The drag velocity.
**Note:** `velocity` is automatically scaled according to the content scale factor, which is defined by the project's stretch mode settings. This means touch sensitivity will appear different depending on resolution when using `velocity` in a script that handles touch aiming. To avoid this, use `screen_velocity` instead.

## Tutorials
- [Using InputEvent]($DOCS_URL/tutorials/inputs/inputevent.html)
