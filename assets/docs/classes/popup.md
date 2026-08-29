# Popup

> class Popup
> inherits Popup Window

## Brief

Base class for contextual windows and panels with fixed position.

## Description

`Popup` is a base class for contextual windows and panels with fixed position. It's a modal by default (see `Window.popup_window`) and provides methods for implementing custom popup behavior.
**Note:** `Popup` is invisible by default. To make it visible, call one of the `popup_*` methods from `Window` on the node, such as `Window.popup_centered_clamped`.

## Properties

> property borderless : bool ; default=true ; setter=set_flag ; getter=get_flag ; overrides=Window

> property maximize_disabled : bool ; default=true ; setter=set_flag ; getter=get_flag ; overrides=Window

> property minimize_disabled : bool ; default=true ; setter=set_flag ; getter=get_flag ; overrides=Window

> property popup_window : bool ; default=true ; setter=set_flag ; getter=get_flag ; overrides=Window

> property popup_wm_hint : bool ; default=true ; setter=set_flag ; getter=get_flag ; overrides=Window

> property transient : bool ; default=true ; setter=set_transient ; getter=is_transient ; overrides=Window

> property unresizable : bool ; default=true ; setter=set_flag ; getter=get_flag ; overrides=Window

> property visible : bool ; default=false ; setter=set_visible ; getter=is_visible ; overrides=Window

> property wrap_controls : bool ; default=true ; setter=set_wrap_controls ; getter=is_wrapping_controls ; overrides=Window

## Signals

> signal popup_hide()

Emitted when the popup is hidden.
