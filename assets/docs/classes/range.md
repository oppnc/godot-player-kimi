# Range

> class Range
> inherits Range Control

## Brief

Abstract base class for controls that represent a number within a range.

## Description

Range is an abstract base class for controls that represent a number within a range, using a configured `step` and `page` size. See e.g. `ScrollBar` and `Slider` for examples of higher-level nodes using Range.

## Properties

> property allow_greater : bool ; default=false ; setter=set_allow_greater ; getter=is_greater_allowed

If `true`, `value` may be greater than `max_value`.

> property allow_lesser : bool ; default=false ; setter=set_allow_lesser ; getter=is_lesser_allowed

If `true`, `value` may be less than `min_value`.

> property exp_edit : bool ; default=false ; setter=set_exp_ratio ; getter=is_ratio_exp

If `true`, and `min_value` is greater or equal to `0`, `value` will be represented exponentially rather than linearly.

> property max_value : float ; default=100.0 ; setter=set_max ; getter=get_max

Maximum value. Range is clamped if `value` is greater than `max_value`.

> property min_value : float ; default=0.0 ; setter=set_min ; getter=get_min

Minimum value. Range is clamped if `value` is less than `min_value`.

> property page : float ; default=0.0 ; setter=set_page ; getter=get_page

Page size. Used mainly for `ScrollBar`. A `ScrollBar`'s grabber length is the `ScrollBar`'s size multiplied by `page` over the difference between `min_value` and `max_value`.

> property ratio : float ; setter=set_as_ratio ; getter=get_as_ratio

The value mapped between 0 and 1.

> property rounded : bool ; default=false ; setter=set_use_rounded_values ; getter=is_using_rounded_values

If `true`, `value` will always be rounded to the nearest integer.

> property size_flags_vertical : BitField[Control.SizeFlags] ; default=0 ; setter=set_v_size_flags ; getter=get_v_size_flags ; overrides=Control

> property step : float ; default=0.01 ; setter=set_step ; getter=get_step

If greater than `0.0`, `value` will always be rounded to a multiple of this property's value above `min_value`. For example, if `min_value` is `0.1` and step is `0.2`, then `value` is limited to `0.1`, `0.3`, `0.5`, and so on. If `rounded` is also `true`, `value` will first be rounded to a multiple of this property's value, then rounded to the nearest integer.

> property value : float ; default=0.0 ; setter=set_value ; getter=get_value

Range's current value. Changing this property (even via code) will trigger `value_changed` signal. Use `set_value_no_signal` if you want to avoid it.

## Methods

> method _value_changed(new_value: float) -> void ; qualifiers=virtual

Called when the `Range`'s value is changed (following the same conditions as `value_changed`).

> method set_value_no_signal(value: float) -> void

Sets the `Range`'s current value to the specified `value`, without emitting the `value_changed` signal.

> method share(with: Node) -> void

Binds two `Range`s together along with any ranges previously grouped with either of them. When any of range's member variables change, it will share the new value with all other ranges in its group.

> method unshare() -> void

Stops the `Range` from sharing its member variables with any other.

## Signals

> signal changed()

Emitted when `min_value`, `max_value`, `page`, or `step` change.

> signal value_changed(value: float)

Emitted when `value` changes. When used on a `Slider`, this is called continuously while dragging (potentially every frame). If you are performing an expensive operation in a function connected to `value_changed`, consider using a *debouncing* `Timer` to call the function less often.
**Note:** Unlike signals such as `LineEdit.text_changed`, `value_changed` is also emitted when `value` is set directly via code.
