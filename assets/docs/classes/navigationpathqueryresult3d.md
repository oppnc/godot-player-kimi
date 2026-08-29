# NavigationPathQueryResult3D

> class NavigationPathQueryResult3D ; experimental=This class may be changed or removed in future versions.
> inherits NavigationPathQueryResult3D RefCounted

## Brief

Represents the result of a 3D pathfinding query.

## Description

This class stores the result of a 3D navigation path query from the `NavigationServer3D`.

## Properties

> property path : PackedVector3Array ; default=PackedVector3Array() ; setter=set_path ; getter=get_path

The resulting path array from the navigation query. All path array positions are in global coordinates. Without customized query parameters this is the same path as returned by `NavigationServer3D.map_get_path`.

> property path_length : float ; default=0.0 ; setter=set_path_length ; getter=get_path_length

Returns the length of the path.

> property path_owner_ids : PackedInt64Array ; default=PackedInt64Array() ; setter=set_path_owner_ids ; getter=get_path_owner_ids

The `ObjectID`s of the `Object`s which manage the regions and links each point of the path goes through.

> property path_rids : Array[RID] ; default=[] ; setter=set_path_rids ; getter=get_path_rids

The `RID`s of the regions and links that each point of the path goes through.

> property path_types : PackedInt32Array ; default=PackedInt32Array() ; setter=set_path_types ; getter=get_path_types

The type of navigation primitive (region or link) that each point of the path goes through.

## Methods

> method reset() -> void

Reset the result object to its initial state. This is useful to reuse the object across multiple queries.

## Enumerations

> enum PathSegmentType

> enum_value PathSegmentType.PATH_SEGMENT_TYPE_REGION = 0

This segment of the path goes through a region.

> enum_value PathSegmentType.PATH_SEGMENT_TYPE_LINK = 1

This segment of the path goes through a link.

## Tutorials
- [Using NavigationPathQueryObjects]($DOCS_URL/tutorials/navigation/navigation_using_navigationpathqueryobjects.html)
