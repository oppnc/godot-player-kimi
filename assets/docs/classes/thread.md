# Thread

> class Thread
> inherits Thread RefCounted

## Brief

A unit of execution in a process.

## Description

A unit of execution in a process. Can run methods on `Object`s simultaneously. The use of synchronization via `Mutex` or `Semaphore` is advised if working with shared objects.
**Warning:** To ensure proper cleanup without crashes or deadlocks, when a `Thread`'s reference count reaches zero and it is therefore destroyed, the following conditions must be met:
- It must not have any `Mutex` objects locked.
- It must not be waiting on any `Semaphore` objects.
- `wait_to_finish` should have been called on it.

## Methods

> method get_id() -> String ; qualifiers=const

Returns the current `Thread`'s ID, uniquely identifying it among all threads. If the `Thread` has not started running or if `wait_to_finish` has been called, this returns an empty string.

> method is_alive() -> bool ; qualifiers=const

Returns `true` if this `Thread` is currently running the provided function. This is useful for determining if `wait_to_finish` can be called without blocking the calling thread.
To check if a `Thread` is joinable, use `is_started`.

> method is_main_thread() -> bool ; qualifiers=static

Returns `true` if the thread this method was called from is the main thread.
**Note:** This is a static method and isn't associated with a specific `Thread` object.

> method is_started() -> bool ; qualifiers=const

Returns `true` if this `Thread` has been started. Once started, this will return `true` until it is joined using `wait_to_finish`. For checking if a `Thread` is still executing its task, use `is_alive`.

> method set_thread_safety_checks_enabled(enabled: bool) -> void ; qualifiers=static

Sets whether the thread safety checks the engine normally performs in methods of certain classes (e.g., `Node`) should happen **on the current thread**.
The default, for every thread, is that they are enabled (as if called with `enabled` being `true`).
Those checks are conservative. That means that they will only succeed in considering a call thread-safe (and therefore allow it to happen) if the engine can guarantee such safety.
Because of that, there may be cases where the user may want to disable them (`enabled` being `false`) to make certain operations allowed again. By doing so, it becomes the user's responsibility to ensure thread safety (e.g., by using `Mutex`) for those objects that are otherwise protected by the engine.
**Note:** This is an advanced usage of the engine. You are advised to use it only if you know what you are doing and there is no safer way.
**Note:** This is useful for scripts running on either arbitrary `Thread` objects or tasks submitted to the `WorkerThreadPool`. It doesn't apply to code running during `Node` group processing, where the checks will be always performed.
**Note:** Even in the case of having disabled the checks in a `WorkerThreadPool` task, there's no need to re-enable them at the end. The engine will do so.

> method start(callable: Callable, priority: Priority = 1) -> Error

Starts a new `Thread` that calls `callable`.
If the method takes some arguments, you can pass them using `Callable.bind`.
The `priority` of the `Thread` can be changed by passing a value from the `Priority` enum.
Returns `OK` on success, or `ERR_CANT_CREATE` on failure.

> method wait_to_finish() -> Variant

Joins the `Thread` and waits for it to finish. Returns the output of the `Callable` passed to `start`.
Should either be used when you want to retrieve the value returned from the method called by the `Thread` or before freeing the instance that contains the `Thread`.
To determine if this can be called without blocking the calling thread, check if `is_alive` is `false`.

## Enumerations

> enum Priority

> enum_value Priority.PRIORITY_LOW = 0

A thread running with lower priority than normally.

> enum_value Priority.PRIORITY_NORMAL = 1

A thread with a standard priority.

> enum_value Priority.PRIORITY_HIGH = 2

A thread running with higher priority than normally.

## Tutorials
- [Using multiple threads]($DOCS_URL/tutorials/performance/using_multiple_threads.html)
- [Thread-safe APIs]($DOCS_URL/tutorials/performance/thread_safe_apis.html)
- [3D Voxel Demo](https://godotengine.org/asset-library/asset/2755)
