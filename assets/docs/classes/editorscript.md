# EditorScript

> class EditorScript
> inherits EditorScript RefCounted

## Brief

Base script that can be used to add extension functions to the editor.

## Description

Scripts extending this class and implementing its `_run` method can be executed from the Script Editor's **File > Run** menu option (or by pressing `Ctrl + Shift + X`) while the editor is running. This is useful for adding custom in-editor functionality to Godot. For more complex additions, consider using `EditorPlugin`s instead.
If a script extending this class also has a global class name, it will be included in the editor's command palette.
**Note:** Extending scripts need to have `tool` mode enabled.
**Example:** Running the following script prints "Hello from the Godot Editor!":

```gdscript
        @tool
        extends EditorScript

        func _run():
            print("Hello from the Godot Editor!")

```

```csharp
        using Godot;

        [Tool]
        public partial class HelloEditor : EditorScript
        {
            public override void _Run()
            {
                GD.Print("Hello from the Godot Editor!");
            }
        }

```

**Note:** EditorScript is `RefCounted`, meaning it is destroyed when nothing references it. This can cause errors during asynchronous operations if there are no references to the script.

## Methods

> method _run() -> void ; qualifiers=virtual required

This method is executed by the Editor when **File > Run** is used.

> method add_root_node(node: Node) -> void ; deprecated=Use `EditorInterface.add_root_node` instead.

Makes `node` root of the currently opened scene. Only works if the scene is empty. If the `node` is a scene instance, an inheriting scene will be created.

> method get_editor_interface() -> EditorInterface ; qualifiers=const ; deprecated=`EditorInterface` is a global singleton and can be accessed directly by its name.

Returns the `EditorInterface` singleton instance.

> method get_scene() -> Node ; qualifiers=const ; deprecated=Use `EditorInterface.get_edited_scene_root` instead.

Returns the edited (current) scene's root `Node`. Equivalent of `EditorInterface.get_edited_scene_root`.
