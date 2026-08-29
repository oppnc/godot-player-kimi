# AcceptDialog

> class AcceptDialog
> inherits AcceptDialog Window

## Brief

A base dialog used for user notification.

## Description

The default use of `AcceptDialog` is to allow it to only be accepted or closed, with the same result. However, the `confirmed` and `canceled` signals allow to make the two actions different, and the `add_button` method allows to add custom buttons and actions.
**Note:** `AcceptDialog` is invisible by default. To make it visible, call one of the `popup_*` methods from `Window` on the node, such as `Window.popup_centered_clamped`.

## Properties

> property dialog_autowrap : bool ; default=false ; setter=set_autowrap ; getter=has_autowrap

Sets autowrapping for the text in the dialog.

> property dialog_close_on_escape : bool ; default=true ; setter=set_close_on_escape ; getter=get_close_on_escape

If `true`, the dialog will be hidden when the `ui_close_dialog` action is pressed (by default, this action is bound to `Escape`, or `Cmd + W` on macOS).

> property dialog_hide_on_ok : bool ; default=true ; setter=set_hide_on_ok ; getter=get_hide_on_ok

If `true`, the dialog is hidden when the OK button is pressed. You can set it to `false` if you want to do e.g. input validation when receiving the `confirmed` signal, and handle hiding the dialog in your own logic.
**Note:** Some nodes derived from this class can have a different default value, and potentially their own built-in logic overriding this setting. For example `FileDialog` defaults to `false`, and has its own input validation code that is called when you press OK, which eventually hides the dialog if the input is valid. As such, this property can't be used in `FileDialog` to disable hiding the dialog when pressing OK.

> property dialog_text : String ; default="" ; setter=set_text ; getter=get_text

The text displayed by the dialog.

> property exclusive : bool ; default=true ; setter=set_exclusive ; getter=is_exclusive ; overrides=Window

> property keep_title_visible : bool ; default=true ; setter=set_keep_title_visible ; getter=get_keep_title_visible ; overrides=Window

> property maximize_disabled : bool ; default=true ; setter=set_flag ; getter=get_flag ; overrides=Window

> property minimize_disabled : bool ; default=true ; setter=set_flag ; getter=get_flag ; overrides=Window

> property ok_button_text : String ; default="" ; setter=set_ok_button_text ; getter=get_ok_button_text

The text displayed by the OK button (see `get_ok_button`). If empty, a default text will be used.

> property title : String ; default="Alert!" ; setter=set_title ; getter=get_title ; overrides=Window

> property transient : bool ; default=true ; setter=set_transient ; getter=is_transient ; overrides=Window

> property visible : bool ; default=false ; setter=set_visible ; getter=is_visible ; overrides=Window

> property wrap_controls : bool ; default=true ; setter=set_wrap_controls ; getter=is_wrapping_controls ; overrides=Window

## Methods

> method add_button(text: String, right: bool = false, action: String = "") -> Button

Adds a button with label `text` and a custom `action` to the dialog and returns the created button.
If `action` is not empty, pressing the button will emit the `custom_action` signal with the specified action string.
If `true`, `right` will place the button to the right of any sibling buttons.
You can use `remove_button` method to remove a button created with this method from the dialog.

> method add_cancel_button(name: String) -> Button

Adds a button with label `name` and a cancel action to the dialog and returns the created button.
You can use `remove_button` method to remove a button created with this method from the dialog.

> method get_label() -> Label

Returns the label used for built-in text.
**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their `CanvasItem.visible` property.

> method get_ok_button() -> Button

Returns the OK `Button` instance.
**Warning:** This is a required internal node, removing and freeing it may cause a crash. If you wish to hide it or any of its children, use their `CanvasItem.visible` property.

> method register_text_enter(line_edit: LineEdit) -> void

Registers a `LineEdit` in the dialog. When the enter key is pressed, the dialog will be accepted.

> method remove_button(button: Button) -> void

Removes the `button` from the dialog. Does NOT free the `button`. The `button` must be a `Button` added with `add_button` or `add_cancel_button` method. After removal, pressing the `button` will no longer emit this dialog's `custom_action` or `canceled` signals.

## Signals

> signal canceled()

Emitted when the dialog is closed or the button created with `add_cancel_button` is pressed.

> signal confirmed()

Emitted when the dialog is accepted, i.e. the OK button is pressed.

> signal custom_action(action: StringName)

Emitted when a custom button with an action is pressed. See `add_button`.

## Theme Properties

> theme_property buttons_min_height : int ; data=constant ; default=0

The minimum height of each button in the bottom row (such as OK/Cancel) in pixels. This can be increased to make buttons with short texts easier to click/tap.

> theme_property buttons_min_width : int ; data=constant ; default=0

The minimum width of each button in the bottom row (such as OK/Cancel) in pixels. This can be increased to make buttons with short texts easier to click/tap.

> theme_property buttons_separation : int ; data=constant ; default=10

The size of the vertical space between the dialog's content and the button row.

> theme_property panel : StyleBox ; data=style

The panel that fills the background of the window.
