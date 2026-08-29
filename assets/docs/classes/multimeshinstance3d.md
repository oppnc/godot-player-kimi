# MultiMeshInstance3D

> class MultiMeshInstance3D ; keywords=batch
> inherits MultiMeshInstance3D GeometryInstance3D

## Brief

Node that instances a `MultiMesh`.

## Description

`MultiMeshInstance3D` is a specialized node to instance `GeometryInstance3D`s based on a `MultiMesh` resource.
This is useful to optimize the rendering of a high number of instances of a given mesh (for example trees in a forest or grass strands).

## Properties

> property multimesh : MultiMesh ; setter=set_multimesh ; getter=get_multimesh

The `MultiMesh` resource that will be used and shared among all instances of the `MultiMeshInstance3D`.

## Tutorials
- [Using MultiMeshInstance]($DOCS_URL/tutorials/3d/using_multi_mesh_instance.html)
- [Optimization using MultiMeshes]($DOCS_URL/tutorials/performance/using_multimesh.html)
- [Animating thousands of fish with MultiMeshInstance]($DOCS_URL/tutorials/performance/vertex_animation/animating_thousands_of_fish.html)
