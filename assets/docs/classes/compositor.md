# Compositor

> class Compositor ; experimental=More customization of the rendering pipeline will be added in the future.
> inherits Compositor Resource

## Brief

Stores attributes used to customize how a Viewport is rendered.

## Description

The compositor resource stores attributes used to customize how a `Viewport` is rendered.

## Properties

> property compositor_effects : Array[CompositorEffect] ; default=[] ; setter=set_compositor_effects ; getter=get_compositor_effects

The custom `CompositorEffect`s that are applied during rendering of viewports using this compositor.

## Tutorials
- [The Compositor]($DOCS_URL/tutorials/rendering/compositor.html)
