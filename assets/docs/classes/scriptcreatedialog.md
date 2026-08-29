# ScriptCreateDialog

> class ScriptCreateDialog
> inherits ScriptCreateDialog ConfirmationDialog

## Brief

Godot editor's popup dialog for creating new `Script` files.

## Description

The `ScriptCreateDialog` creates script files according to a given template for a given scripting language. The standard use is to configure its fields prior to calling one of the `Window.popup` methods.

```gdscript
        func _ready():
            var dialog = ScriptCreateDialog.new();
            dialog.config("Node", "res://new_node.gd") # For in-engine types.
            dialog.config("\"res://base_node.gd\"", "res://derived_node.gd") # For script types.
            dialog.popup_centered()

```

```csharp
        public override void _Ready()
        {
            var dialog = new ScriptCreateDialog();
            dialog.Config("Node", "res://NewNode.cs"); // For in-engine types.
            dialog.Config("\"res://BaseNode.cs\"", "res://DerivedNode.cs"); // For script types.
            dialog.PopupCentered();
        }

```

## Properties

> property dialog_hide_on_ok : bool ; default=false ; setter=set_hide_on_ok ; getter=get_hide_on_ok ; overrides=AcceptDialog

> property ok_button_text : String ; default="Create" ; setter=set_ok_button_text ; getter=get_ok_button_text ; overrides=AcceptDialog

> property title : String ; default="Attach Node Script" ; setter=set_title ; getter=get_title ; overrides=Window

## Methods

> method config(inherits: String, path: String, built_in_enabled: bool = true, load_enabled: bool = true) -> void

Prefills required fields to configure the ScriptCreateDialog for use.

## Signals

> signal script_created(script: Script)

Emitted when the user clicks the OK button.
