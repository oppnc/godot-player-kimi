# PlaceholderTextureLayered

> class PlaceholderTextureLayered
> inherits PlaceholderTextureLayered TextureLayered

## Brief

Placeholder class for a 2-dimensional texture array.

## Description

This class is used when loading a project that uses a `TextureLayered` subclass in 2 conditions:
- When running the project exported in dedicated server mode, only the texture's dimensions are kept (as they may be relied upon for gameplay purposes or positioning of other elements). This allows reducing the exported PCK's size significantly.
- When this subclass is missing due to using a different engine version or build (e.g. modules disabled).
**Note:** This is not intended to be used as an actual texture for rendering. It is not guaranteed to work like one in shaders or materials (for example when calculating UV).

## Properties

> property layers : int ; default=1 ; setter=set_layers ; getter=get_layers

The number of layers in the texture array.

> property size : Vector2i ; default=Vector2i(1, 1) ; setter=set_size ; getter=get_size

The size of each texture layer (in pixels).
