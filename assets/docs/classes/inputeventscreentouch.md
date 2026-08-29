# InputEventScreenTouch

> class InputEventScreenTouch
> inherits InputEventScreenTouch InputEventFromWindow

## Brief

Represents a screen touch event.

## Description

Stores information about multi-touch press/release input events. Supports touch press, touch release and `index` for multi-touch count and order.

## Properties

> property canceled : bool ; default=false ; setter=set_canceled ; getter=is_canceled

If `true`, the touch event has been canceled.

> property double_tap : bool ; default=false ; setter=set_double_tap ; getter=is_double_tap

If `true`, the touch's state is a double tap.

> property index : int ; default=0 ; setter=set_index ; getter=get_index

The touch index in the case of a multi-touch event. One index = one finger.

> property position : Vector2 ; default=Vector2(0, 0) ; setter=set_position ; getter=get_position

The touch position in the viewport the node is in, using the coordinate system of this viewport.

> property pressed : bool ; default=false ; setter=set_pressed ; getter=is_pressed

If `true`, the touch's state is pressed. If `false`, the touch's state is released.

## Tutorials
- [Using InputEvent]($DOCS_URL/tutorials/inputs/inputevent.html)
