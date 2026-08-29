# TouchScreenButton

> class TouchScreenButton
> inherits TouchScreenButton Node2D

## Brief

Button for touch screen devices for gameplay use.

## Description

TouchScreenButton allows you to create on-screen buttons for touch devices. It's intended for gameplay use, such as a unit you have to touch to move. Unlike `Button`, TouchScreenButton supports multitouch out of the box. Several TouchScreenButtons can be pressed at the same time with touch input.
This node inherits from `Node2D`. Unlike with `Control` nodes, you cannot set anchors on it. If you want to create menus or user interfaces, you may want to use `Button` nodes instead. To make button nodes react to touch events, you can enable `ProjectSettings.input_devices/pointing/emulate_mouse_from_touch` in the Project Settings.
You can configure TouchScreenButton to be visible only on touch devices, helping you develop your game both for desktop and mobile devices.

## Properties

> property action : String ; default="" ; setter=set_action ; getter=get_action

The button's action. Actions can be handled with `InputEventAction`.

> property bitmask : BitMap ; setter=set_bitmask ; getter=get_bitmask

The button's bitmask.

> property passby_press : bool ; default=false ; setter=set_passby_press ; getter=is_passby_press_enabled

If `true`, the `pressed` and `released` signals are emitted whenever a pressed finger goes in and out of the button, even if the pressure started outside the active area of the button.
**Note:** This is a "pass-by" (not "bypass") press mode.

> property shape : Shape2D ; setter=set_shape ; getter=get_shape

The button's shape.

> property shape_centered : bool ; default=true ; setter=set_shape_centered ; getter=is_shape_centered

If `true`, the button's shape is centered in the provided texture. If no texture is used, this property has no effect.

> property shape_visible : bool ; default=true ; setter=set_shape_visible ; getter=is_shape_visible

If `true`, the button's shape is visible in the editor.

> property texture_normal : Texture2D ; setter=set_texture_normal ; getter=get_texture_normal

The button's texture for the normal state.

> property texture_pressed : Texture2D ; setter=set_texture_pressed ; getter=get_texture_pressed

The button's texture for the pressed state.

> property visibility_mode : VisibilityMode ; default=0 ; setter=set_visibility_mode ; getter=get_visibility_mode

The button's visibility mode.

## Methods

> method is_pressed() -> bool ; qualifiers=const

Returns `true` if this button is currently pressed.

## Signals

> signal pressed()

Emitted when the button is pressed (down).

> signal released()

Emitted when the button is released (up).

## Enumerations

> enum VisibilityMode

> enum_value VisibilityMode.VISIBILITY_ALWAYS = 0

Always visible.

> enum_value VisibilityMode.VISIBILITY_TOUCHSCREEN_ONLY = 1

Visible on touch screens only.
