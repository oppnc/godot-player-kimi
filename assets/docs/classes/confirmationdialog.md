# ConfirmationDialog

> class ConfirmationDialog
> inherits ConfirmationDialog AcceptDialog

## Brief

A dialog used for confirmation of actions.

## Description

A dialog used for confirmation of actions. This window is similar to `AcceptDialog`, but pressing its Cancel button can have a different outcome from pressing the OK button. The order of the two buttons varies depending on the host OS.
To get cancel action, you can use:

```gdscript
        get_cancel_button().pressed.connect(_on_canceled)

```

```csharp
        GetCancelButton().Pressed += OnCanceled;

```

**Note:** `AcceptDialog` is invisible by default. To make it visible, call one of the `popup_*` methods from `Window` on the node, such as `Window.popup_centered_clamped`.

## Properties

> property cancel_button_text : String ; default="Cancel" ; setter=set_cancel_button_text ; getter=get_cancel_button_text

The text displayed by the cancel button (see `get_cancel_button`).

> property min_size : Vector2i ; default=Vector2i(200, 70) ; setter=set_min_size ; getter=get_min_size ; overrides=Window

> property size : Vector2i ; default=Vector2i(200, 100) ; setter=set_size ; getter=get_size ; overrides=Window

> property title : String ; default="Please Confirm..." ; setter=set_title ; getter=get_title ; overrides=Window

## Methods

> method get_cancel_button() -> Button

Returns the cancel button.
**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their `CanvasItem.visible` property.
