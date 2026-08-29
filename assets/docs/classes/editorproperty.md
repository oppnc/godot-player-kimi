# EditorProperty

> class EditorProperty
> inherits EditorProperty Container

## Brief

Custom control for editing properties that can be added to the `EditorInspector`.

## Description

A custom control for editing properties that can be added to the `EditorInspector`. It is added via `EditorInspectorPlugin`.

## Properties

> property checkable : bool ; default=false ; setter=set_checkable ; getter=is_checkable

Used by the inspector, set to `true` when the property is checkable.

> property checked : bool ; default=false ; setter=set_checked ; getter=is_checked

Used by the inspector, set to `true` when the property is checked.

> property deletable : bool ; default=false ; setter=set_deletable ; getter=is_deletable

Used by the inspector, set to `true` when the property can be deleted by the user.

> property draw_background : bool ; default=true ; setter=set_draw_background ; getter=is_draw_background

Used by the inspector, set to `true` when the property background is drawn.

> property draw_label : bool ; default=true ; setter=set_draw_label ; getter=is_draw_label

Used by the inspector, set to `true` when the property label is drawn.

> property draw_warning : bool ; default=false ; setter=set_draw_warning ; getter=is_draw_warning

Used by the inspector, set to `true` when the property is drawn with the editor theme's warning color. This is used for editable children's properties.

> property focus_mode : Control.FocusMode ; default=3 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property keying : bool ; default=false ; setter=set_keying ; getter=is_keying

Used by the inspector, set to `true` when the property can add keys for animation.

> property label : String ; default="" ; setter=set_label ; getter=get_label

Set this property to change the label (if you want to show one).

> property name_split_ratio : float ; default=0.5 ; setter=set_name_split_ratio ; getter=get_name_split_ratio

Space distribution ratio between the label and the editing field.

> property read_only : bool ; default=false ; setter=set_read_only ; getter=is_read_only

Used by the inspector, set to `true` when the property is read-only.

> property selectable : bool ; default=true ; setter=set_selectable ; getter=is_selectable

Used by the inspector, set to `true` when the property is selectable.

> property use_folding : bool ; default=false ; setter=set_use_folding ; getter=is_using_folding

Used by the inspector, set to `true` when the property is using folding.

## Methods

> method _set_read_only(read_only: bool) -> void ; qualifiers=virtual

Called when the read-only status of the property is changed. It may be used to change custom controls into a read-only or modifiable state.

> method _update_property() -> void ; qualifiers=virtual

When this virtual function is called, you must update your editor.

> method add_focusable(control: Control) -> void

If any of the controls added can gain keyboard focus, add it here. This ensures that focus will be restored if the inspector is refreshed.

> method deselect() -> void

Draw property as not selected. Used by the inspector.

> method emit_changed(property: StringName, value: Variant, field: StringName = &"", changing: bool = false) -> void

If one or several properties have changed, this must be called. `field` is used in case your editor can modify fields separately (as an example, Vector3.x). The `changing` argument avoids the editor requesting this property to be refreshed (leave as `false` if unsure).

> method get_edited_object() -> Object

Returns the edited object.
**Note:** This method could return `null` if the editor has not yet been associated with a property. However, in `_update_property` and `_set_read_only`, this value is *guaranteed* to be non-`null`.

> method get_edited_property() -> StringName ; qualifiers=const

Returns the edited property. If your editor is for a single property (added via `EditorInspectorPlugin._parse_property`), then this will return the property.
**Note:** This method could return `null` if the editor has not yet been associated with a property. However, in `_update_property` and `_set_read_only`, this value is *guaranteed* to be non-`null`.

> method is_selected() -> bool ; qualifiers=const

Returns `true` if property is drawn as selected. Used by the inspector.

> method select(focusable: int = -1) -> void

Draw property as selected. Used by the inspector.

> method set_bottom_editor(editor: Control) -> void

Puts the `editor` control below the property label. The control must be previously added using `Node.add_child`.

> method set_label_reference(control: Control) -> void

Used by the inspector, set to a control that will be used as a reference to calculate the size of the label.

> method set_object_and_property(object: Object, property: StringName) -> void

Assigns object and property to edit.

> method update_property() -> void

Forces a refresh of the property display.

## Signals

> signal multiple_properties_changed(properties: PackedStringArray, value: Array)

Emit it if you want multiple properties modified at the same time. Do not use if added via `EditorInspectorPlugin._parse_property`.

> signal object_id_selected(property: StringName, id: int)

Used by sub-inspectors. Emit it if what was selected was an Object ID.

> signal property_can_revert_changed(property: StringName, can_revert: bool)

Emitted when the revertability (i.e., whether it has a non-default value and thus is displayed with a revert icon) of a property has changed.

> signal property_changed(property: StringName, value: Variant, field: StringName, changing: bool)

Do not emit this manually, use the `emit_changed` method instead.

> signal property_checked(property: StringName, checked: bool)

Emitted when a property was checked. Used internally.

> signal property_deleted(property: StringName)

Emitted when a property was deleted. Used internally.

> signal property_favorited(property: StringName, favorited: bool)

Emit it if you want to mark a property as favorited, making it appear at the top of the inspector.

> signal property_keyed(property: StringName)

Emit it if you want to add this value as an animation key (check for keying being enabled first).

> signal property_keyed_with_value(property: StringName, value: Variant)

Emit it if you want to key a property with a single value.

> signal property_overridden()

Emitted when a setting override for the current project is requested.

> signal property_pinned(property: StringName, pinned: bool)

Emit it if you want to mark (or unmark) the value of a property for being saved regardless of being equal to the default value.
The default value is the one the property will get when the node is just instantiated and can come from an ancestor scene in the inheritance/instantiation chain, a script or a builtin class.

> signal resource_selected(path: String, resource: Resource)

If you want a sub-resource to be edited, emit this signal with the resource.

> signal selected(path: String, focusable_idx: int)

Emitted when selected. Used internally.
