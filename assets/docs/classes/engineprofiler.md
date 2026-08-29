# EngineProfiler

> class EngineProfiler
> inherits EngineProfiler RefCounted

## Brief

Base class for creating custom profilers.

## Description

This class can be used to implement custom profilers that are able to interact with the engine and editor debugger.
See `EngineDebugger` and `EditorDebuggerPlugin` for more information.

## Methods

> method _add_frame(data: Array) -> void ; qualifiers=virtual

Called when data is added to profiler using `EngineDebugger.profiler_add_frame_data`.

> method _tick(frame_time: float, process_time: float, physics_time: float, physics_frame_time: float) -> void ; qualifiers=virtual

Called once every engine iteration when the profiler is active with information about the current frame. All time values are in seconds. Lower values represent faster processing times and are therefore considered better.

> method _toggle(enable: bool, options: Array) -> void ; qualifiers=virtual

Called when the profiler is enabled/disabled, along with a set of `options`.
