# StatusIndicator

> class StatusIndicator ; keywords=tray
> inherits StatusIndicator Node

## Brief

Application status indicator (aka notification area icon).
**Note:** Status indicator is implemented on macOS and Windows.

## Properties

> property icon : Texture2D ; setter=set_icon ; getter=get_icon

Status indicator icon.

> property menu : NodePath ; default=NodePath("") ; setter=set_menu ; getter=get_menu

Status indicator native popup menu. If this is set, the `pressed` signal is not emitted.
**Note:** Native popup is only supported if `NativeMenu` supports `NativeMenu.FEATURE_POPUP_MENU` feature.

> property tooltip : String ; default="" ; setter=set_tooltip ; getter=get_tooltip

Status indicator tooltip.

> property visible : bool ; default=true ; setter=set_visible ; getter=is_visible

If `true`, the status indicator is visible.

## Methods

> method get_rect() -> Rect2 ; qualifiers=const

Returns the status indicator rectangle in screen coordinates. If this status indicator is not visible, returns an empty `Rect2`.

## Signals

> signal pressed(mouse_button: int, mouse_position: Vector2i)

Emitted when the status indicator is pressed.
