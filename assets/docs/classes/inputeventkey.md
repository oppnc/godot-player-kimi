# InputEventKey

> class InputEventKey
> inherits InputEventKey InputEventWithModifiers

## Brief

Represents a key on a keyboard being pressed or released.

## Description

An input event for keys on a keyboard. Supports key presses, key releases and `echo` events. It can also be received in `Node._unhandled_key_input`.
**Note:** Events received from the keyboard usually have all properties set. Event mappings should have only one of the `keycode`, `physical_keycode` or `unicode` set.
When events are compared, properties are checked in the following priority - `keycode`, `physical_keycode` and `unicode`. Events with the first matching value will be considered equal.

## Properties

> property echo : bool ; default=false ; setter=set_echo ; getter=is_echo

If `true`, the key was already pressed before this event. An echo event is a repeated key event sent when the user is holding down the key.
**Note:** The rate at which echo events are sent is typically around 20 events per second (after holding down the key for roughly half a second). However, the key repeat delay/speed can be changed by the user or disabled entirely in the operating system settings. To ensure your project works correctly on all configurations, do not assume the user has a specific key repeat configuration in your project's behavior.

> property key_label : Key ; default=0 ; setter=set_key_label ; getter=get_key_label

Represents the localized label printed on the key in the current keyboard layout, which corresponds to one of the `Key` constants or any valid Unicode character. Key labels are meant for key prompts.
For keyboard layouts with a single label on the key, it is equivalent to `keycode`.
To get a human-readable representation of the `InputEventKey`, use `OS.get_keycode_string(event.key_label)` where `event` is the `InputEventKey`.

```text
            +-----+ +-----+
            | Q   | | Q   | - "Q" - keycode
            |   Й | |  ض | - "Й" and "ض" - key_label
            +-----+ +-----+

```

> property keycode : Key ; default=0 ; setter=set_keycode ; getter=get_keycode

Latin label printed on the key in the current keyboard layout, which corresponds to one of the `Key` constants. Key codes are meant for shortcuts expressed with a standard Latin keyboard, such as `Ctrl + S` for a "Save" shortcut.
To get a human-readable representation of the `InputEventKey`, use `OS.get_keycode_string(event.keycode)` where `event` is the `InputEventKey`.

```text
            +-----+ +-----+
            | Q   | | Q   | - "Q" - keycode
            |   Й | |  ض | - "Й" and "ض" - key_label
            +-----+ +-----+

```

> property location : KeyLocation ; default=0 ; setter=set_location ; getter=get_location

Represents the location of a key which has both left and right versions, such as `Shift` or `Alt`.

> property physical_keycode : Key ; default=0 ; setter=set_physical_keycode ; getter=get_physical_keycode

Represents the physical location of a key on the 101/102-key US QWERTY keyboard, which corresponds to one of the `Key` constants. Physical key codes meant for game input, such as WASD movement, where only the location of the keys is important.
To get a human-readable representation of the `InputEventKey`, use `OS.get_keycode_string` in combination with `DisplayServer.keyboard_get_keycode_from_physical` or `DisplayServer.keyboard_get_label_from_physical`:

```gdscript
            func _input(event):
                if event is InputEventKey:
                    var keycode = DisplayServer.keyboard_get_keycode_from_physical(event.physical_keycode)
                    var label = DisplayServer.keyboard_get_label_from_physical(event.physical_keycode)
                    print(OS.get_keycode_string(keycode))
                    print(OS.get_keycode_string(label))

```

```csharp
            public override void _Input(InputEvent @event)
            {
                if (@event is InputEventKey inputEventKey)
                {
                    var keycode = DisplayServer.KeyboardGetKeycodeFromPhysical(inputEventKey.PhysicalKeycode);
                    var label = DisplayServer.KeyboardGetLabelFromPhysical(inputEventKey.PhysicalKeycode);
                    GD.Print(OS.GetKeycodeString(keycode));
                    GD.Print(OS.GetKeycodeString(label));
                }
            }

```

> property pressed : bool ; default=false ; setter=set_pressed ; getter=is_pressed

If `true`, the key's state is pressed. If `false`, the key's state is released.

> property unicode : int ; default=0 ; setter=set_unicode ; getter=get_unicode

The key Unicode character code (when relevant), shifted by modifier keys. Unicode character codes for composite characters and complex scripts may not be available unless IME input mode is active. See `Window.set_ime_active` for more information. Unicode character codes are meant for text input.
**Note:** This property is set by the engine only for a pressed event. If the event is sent by an IME or a virtual keyboard, no corresponding key released event is sent.

## Methods

> method as_text_key_label() -> String ; qualifiers=const

Returns a `String` representation of the event's `key_label` and modifiers.

> method as_text_keycode() -> String ; qualifiers=const

Returns a `String` representation of the event's `keycode` and modifiers.

> method as_text_location() -> String ; qualifiers=const

Returns a `String` representation of the event's `location`. This will be a blank string if the event is not specific to a location.

> method as_text_physical_keycode() -> String ; qualifiers=const

Returns a `String` representation of the event's `physical_keycode` and modifiers.

> method get_key_label_with_modifiers() -> Key ; qualifiers=const

Returns the localized key label combined with modifier keys such as `Shift` or `Alt`. See also `InputEventWithModifiers`.
To get a human-readable representation of the `InputEventKey` with modifiers, use `OS.get_keycode_string(event.get_key_label_with_modifiers())` where `event` is the `InputEventKey`.

> method get_keycode_with_modifiers() -> Key ; qualifiers=const

Returns the Latin keycode combined with modifier keys such as `Shift` or `Alt`. See also `InputEventWithModifiers`.
To get a human-readable representation of the `InputEventKey` with modifiers, use `OS.get_keycode_string(event.get_keycode_with_modifiers())` where `event` is the `InputEventKey`.

> method get_physical_keycode_with_modifiers() -> Key ; qualifiers=const

Returns the physical keycode combined with modifier keys such as `Shift` or `Alt`. See also `InputEventWithModifiers`.
To get a human-readable representation of the `InputEventKey` with modifiers, use `OS.get_keycode_string(event.get_physical_keycode_with_modifiers())` where `event` is the `InputEventKey`.

## Tutorials
- [Using InputEvent]($DOCS_URL/tutorials/inputs/inputevent.html)
