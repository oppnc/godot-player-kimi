# TranslationDomain

> class TranslationDomain
> inherits TranslationDomain RefCounted

## Brief

A self-contained collection of `Translation` resources.

## Description

`TranslationDomain` is a self-contained collection of `Translation` resources. Translations can be added to or removed from it.
If you're working with the main translation domain, it is more convenient to use the wrap methods on `TranslationServer`.

## Properties

> property enabled : bool ; default=true ; setter=set_enabled ; getter=is_enabled

If `true`, translation is enabled. Otherwise, `translate` and `translate_plural` will return the input message unchanged regardless of the current locale.

> property pseudolocalization_accents_enabled : bool ; default=true ; setter=set_pseudolocalization_accents_enabled ; getter=is_pseudolocalization_accents_enabled

Replace all characters with their accented variants during pseudolocalization.
**Note:** Updating this property does not automatically update texts in the scene tree. Please propagate the `MainLoop.NOTIFICATION_TRANSLATION_CHANGED` notification manually after you have finished modifying pseudolocalization related options.

> property pseudolocalization_double_vowels_enabled : bool ; default=false ; setter=set_pseudolocalization_double_vowels_enabled ; getter=is_pseudolocalization_double_vowels_enabled

Double vowels in strings during pseudolocalization to simulate the lengthening of text due to localization.
**Note:** Updating this property does not automatically update texts in the scene tree. Please propagate the `MainLoop.NOTIFICATION_TRANSLATION_CHANGED` notification manually after you have finished modifying pseudolocalization related options.

> property pseudolocalization_enabled : bool ; default=false ; setter=set_pseudolocalization_enabled ; getter=is_pseudolocalization_enabled

If `true`, enables pseudolocalization for the project. This can be used to spot untranslatable strings or layout issues that may occur once the project is localized to languages that have longer strings than the source language.
**Note:** Updating this property does not automatically update texts in the scene tree. Please propagate the `MainLoop.NOTIFICATION_TRANSLATION_CHANGED` notification manually after you have finished modifying pseudolocalization related options.

> property pseudolocalization_expansion_ratio : float ; default=0.0 ; setter=set_pseudolocalization_expansion_ratio ; getter=get_pseudolocalization_expansion_ratio

The expansion ratio to use during pseudolocalization. A value of `0.3` is sufficient for most practical purposes, and will increase the length of each string by 30%.
**Note:** Updating this property does not automatically update texts in the scene tree. Please propagate the `MainLoop.NOTIFICATION_TRANSLATION_CHANGED` notification manually after you have finished modifying pseudolocalization related options.

> property pseudolocalization_fake_bidi_enabled : bool ; default=false ; setter=set_pseudolocalization_fake_bidi_enabled ; getter=is_pseudolocalization_fake_bidi_enabled

If `true`, emulate bidirectional (right-to-left) text when pseudolocalization is enabled. This can be used to spot issues with RTL layout and UI mirroring that will crop up if the project is localized to RTL languages such as Arabic or Hebrew.
**Note:** Updating this property does not automatically update texts in the scene tree. Please propagate the `MainLoop.NOTIFICATION_TRANSLATION_CHANGED` notification manually after you have finished modifying pseudolocalization related options.

> property pseudolocalization_override_enabled : bool ; default=false ; setter=set_pseudolocalization_override_enabled ; getter=is_pseudolocalization_override_enabled

Replace all characters in the string with `*`. Useful for finding non-localizable strings.
**Note:** Updating this property does not automatically update texts in the scene tree. Please propagate the `MainLoop.NOTIFICATION_TRANSLATION_CHANGED` notification manually after you have finished modifying pseudolocalization related options.

> property pseudolocalization_prefix : String ; default="[" ; setter=set_pseudolocalization_prefix ; getter=get_pseudolocalization_prefix

Prefix that will be prepended to the pseudolocalized string.
**Note:** Updating this property does not automatically update texts in the scene tree. Please propagate the `MainLoop.NOTIFICATION_TRANSLATION_CHANGED` notification manually after you have finished modifying pseudolocalization related options.

> property pseudolocalization_skip_placeholders_enabled : bool ; default=true ; setter=set_pseudolocalization_skip_placeholders_enabled ; getter=is_pseudolocalization_skip_placeholders_enabled

Skip placeholders for string formatting like `%s` or `%f` during pseudolocalization. Useful to identify strings which need additional control characters to display correctly.
**Note:** Updating this property does not automatically update texts in the scene tree. Please propagate the `MainLoop.NOTIFICATION_TRANSLATION_CHANGED` notification manually after you have finished modifying pseudolocalization related options.

> property pseudolocalization_suffix : String ; default="]" ; setter=set_pseudolocalization_suffix ; getter=get_pseudolocalization_suffix

Suffix that will be appended to the pseudolocalized string.
**Note:** Updating this property does not automatically update texts in the scene tree. Please propagate the `MainLoop.NOTIFICATION_TRANSLATION_CHANGED` notification manually after you have finished modifying pseudolocalization related options.

## Methods

> method add_translation(translation: Translation) -> void

Adds a translation.

> method clear() -> void

Removes all translations.

> method find_translations(locale: String, exact: bool) -> Array[Translation] ; qualifiers=const

Returns the `Translation` instances that match `locale` (see `TranslationServer.compare_locales`). If `exact` is `true`, only instances whose locale exactly equals `locale` will be returned.

> method get_locale_override() -> String ; qualifiers=const

Returns the locale override of the domain. Returns an empty string if locale override is disabled.

> method get_translation_object(locale: String) -> Translation ; qualifiers=const ; deprecated=Use `find_translations` instead.

Returns the `Translation` instance that best matches `locale`. Returns `null` if there are no matches.

> method get_translations() -> Array[Translation] ; qualifiers=const

Returns all available `Translation` instances as added by `add_translation`.

> method has_translation(translation: Translation) -> bool ; qualifiers=const

Returns `true` if this translation domain contains the given `translation`.

> method has_translation_for_locale(locale: String, exact: bool) -> bool ; qualifiers=const

Returns `true` if there are any `Translation` instances that match `locale` (see `TranslationServer.compare_locales`). If `exact` is `true`, only instances whose locale exactly equals `locale` are considered.

> method pseudolocalize(message: StringName) -> StringName ; qualifiers=const

Returns the pseudolocalized string based on the `message` passed in.

> method remove_translation(translation: Translation) -> void

Removes the given translation.

> method set_locale_override(locale: String) -> void

Sets the locale override of the domain.
If `locale` is an empty string, locale override is disabled. Otherwise, `locale` will be standardized to match known locales (e.g. `en-US` would be matched to `en_US`).
**Note:** Calling this method does not automatically update texts in the scene tree. Please propagate the `MainLoop.NOTIFICATION_TRANSLATION_CHANGED` signal manually.

> method translate(message: StringName, context: StringName = &"") -> StringName ; qualifiers=const

Returns the current locale's translation for the given message and context.

> method translate_plural(message: StringName, message_plural: StringName, n: int, context: StringName = &"") -> StringName ; qualifiers=const

Returns the current locale's translation for the given message, plural message and context.
The number `n` is the number or quantity of the plural object. It will be used to guide the translation system to fetch the correct plural form for the selected language.
