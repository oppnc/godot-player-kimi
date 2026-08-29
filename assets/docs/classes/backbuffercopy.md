# BackBufferCopy

> class BackBufferCopy
> inherits BackBufferCopy Node2D

## Brief

A node that copies a region of the screen to a buffer for access in shader code.

## Description

Node for back-buffering the currently-displayed screen. The region defined in the `BackBufferCopy` node is buffered with the content of the screen it covers, or the entire screen according to the `copy_mode`. It can be accessed in shader scripts using the screen texture (i.e. a uniform sampler with `hint_screen_texture`).
**Note:** Since this node inherits from `Node2D` (and not `Control`), anchors and margins won't apply to child `Control`-derived nodes. This can be problematic when resizing the window. To avoid this, add `Control`-derived nodes as *siblings* to the `BackBufferCopy` node instead of adding them as children.

## Properties

> property copy_mode : CopyMode ; default=1 ; setter=set_copy_mode ; getter=get_copy_mode

Buffer mode.

> property rect : Rect2 ; default=Rect2(-100, -100, 200, 200) ; setter=set_rect ; getter=get_rect

The area covered by the `BackBufferCopy`. Only used if `copy_mode` is `COPY_MODE_RECT`.

## Enumerations

> enum CopyMode

> enum_value CopyMode.COPY_MODE_DISABLED = 0

Disables the buffering mode. This means the `BackBufferCopy` node will directly use the portion of screen it covers.

> enum_value CopyMode.COPY_MODE_RECT = 1

`BackBufferCopy` buffers a rectangular region.

> enum_value CopyMode.COPY_MODE_VIEWPORT = 2

`BackBufferCopy` buffers the entire screen.

## Tutorials
- [Screen-reading shaders]($DOCS_URL/tutorials/shaders/screen-reading_shaders.html)
