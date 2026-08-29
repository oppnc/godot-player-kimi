# Translation

> class Translation
> inherits Translation Resource

## Brief

A language translation that maps a collection of strings to their individual translations.

## Description

`Translation` maps a collection of strings to their individual translations, and also provides convenience methods for pluralization.
A `Translation` consists of messages. A message is identified by its context and untranslated string. Unlike [gettext](https://www.gnu.org/software/gettext/), using an empty context string in Godot means not using any context.

## Properties

> property locale : String ; default="en" ; setter=set_locale ; getter=get_locale

The locale of the translation.

> property plural_rules_override : String ; default="" ; setter=set_plural_rules_override ; getter=get_plural_rules_override

The plural rules string to enforce. See [GNU gettext](https://www.gnu.org/software/gettext/manual/html_node/Plural-forms.html) for examples and more info.
If empty or invalid, default plural rules from `TranslationServer.get_plural_rules` are used. The English plural rules are used as a fallback.

## Methods

> method _get_message(src_message: StringName, context: StringName) -> StringName ; qualifiers=virtual const

Virtual method to override `get_message`.

> method _get_plural_message(src_message: StringName, src_plural_message: StringName, n: int, context: StringName) -> StringName ; qualifiers=virtual const

Virtual method to override `get_plural_message`.

> method add_message(src_message: StringName, xlated_message: StringName, context: StringName = &"") -> void

Adds a message if nonexistent, followed by its translation.
An additional context could be used to specify the translation context or differentiate polysemic words.

> method add_plural_message(src_message: StringName, xlated_messages: PackedStringArray, context: StringName = &"") -> void

Adds a message involving plural translation if nonexistent, followed by its translation.
An additional context could be used to specify the translation context or differentiate polysemic words.

> method erase_message(src_message: StringName, context: StringName = &"") -> void

Erases a message.

> method get_message(src_message: StringName, context: StringName = &"") -> StringName ; qualifiers=const

Returns a message's translation.

> method get_message_count() -> int ; qualifiers=const

Returns the number of existing messages.

> method get_message_list() -> PackedStringArray ; qualifiers=const

Returns the keys of all messages, that is, the context and untranslated strings of each message.
**Note:** If a message does not use a context, the corresponding element is the untranslated string. Otherwise, the corresponding element is the context and untranslated string separated by the EOT character (`U+0004`). This is done for compatibility purposes.

```text
                for key in translation.get_message_list():
                    var p = key.find("\u0004")
                    if p == -1:
                        var untranslated = key
                        print("Message %s" % untranslated)
                    else:
                        var context = key.substr(0, p)
                        var untranslated = key.substr(p + 1)
                        print("Message %s with context %s" % [untranslated, context])

```

> method get_plural_message(src_message: StringName, src_plural_message: StringName, n: int, context: StringName = &"") -> StringName ; qualifiers=const

Returns a message's translation involving plurals.
The number `n` is the number or quantity of the plural object. It will be used to guide the translation system to fetch the correct plural form for the selected language.
**Note:** Plurals are only supported in [gettext-based translations (PO)]($DOCS_URL/tutorials/i18n/localization_using_gettext.html), not CSV.

> method get_translated_message_list() -> PackedStringArray ; qualifiers=const

Returns all the translated strings.

## Tutorials
- [Internationalizing games]($DOCS_URL/tutorials/i18n/internationalizing_games.html)
- [Localization using gettext]($DOCS_URL/tutorials/i18n/localization_using_gettext.html)
- [Locales]($DOCS_URL/tutorials/i18n/locales.html)
