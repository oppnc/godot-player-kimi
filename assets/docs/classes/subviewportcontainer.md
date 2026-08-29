# SubViewportContainer

> class SubViewportContainer
> inherits SubViewportContainer Container

## Brief

A container used for displaying the contents of a `SubViewport`.

## Description

A container that displays the contents of underlying `SubViewport` child nodes. It uses the combined size of the `SubViewport`s as minimum size, unless `stretch` is enabled.
**Note:** Changing a `SubViewportContainer`'s `Control.scale` will cause its contents to appear distorted. To change its visual size without causing distortion, adjust the node's margins instead (if it's not already in a container).
**Note:** The `SubViewportContainer` forwards mouse-enter and mouse-exit notifications to its sub-viewports.

## Properties

> property focus_mode : Control.FocusMode ; default=1 ; setter=set_focus_mode ; getter=get_focus_mode ; overrides=Control

> property mouse_target : bool ; default=false ; setter=set_mouse_target ; getter=is_mouse_target_enabled

Configure, if either the `SubViewportContainer` or alternatively the `Control` nodes of its `SubViewport` children should be available as targets of mouse-related functionalities, like identifying the drop target in drag-and-drop operations or cursor shape of hovered `Control` node.
If `false`, the `Control` nodes inside its `SubViewport` children are considered as targets.
If `true`, the `SubViewportContainer` itself will be considered as a target.

> property stretch : bool ; default=false ; setter=set_stretch ; getter=is_stretch_enabled

If `true`, the sub-viewport will be automatically resized to the control's size.
**Note:** If `true`, this will prohibit changing `SubViewport.size` of its children manually.

> property stretch_shrink : int ; default=1 ; setter=set_stretch_shrink ; getter=get_stretch_shrink

Divides the sub-viewport's effective resolution by this value while preserving its scale. This can be used to speed up rendering.
For example, a 1280×720 sub-viewport with `stretch_shrink` set to `2` will be rendered at 640×360 while occupying the same size in the container.
**Note:** `stretch` must be `true` for this property to work.

## Methods

> method _propagate_input_event(event: InputEvent) -> bool ; qualifiers=virtual const ; experimental=This method may be changed or removed in future versions.

Virtual method to be implemented by the user. If it returns `true`, the `event` is propagated to `SubViewport` children. Propagation doesn't happen if it returns `false`. If the function is not implemented, all events are propagated to SubViewports.
