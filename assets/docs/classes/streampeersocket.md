# StreamPeerSocket

> class StreamPeerSocket
> inherits StreamPeerSocket StreamPeer

## Brief

Abstract base class for interacting with socket streams.

## Description

StreamPeerSocket is an abstract base class that defines common behavior for socket-based streams.

## Methods

> method disconnect_from_host() -> void

Disconnects from host.

> method get_status() -> Status ; qualifiers=const

Returns the status of the connection.

> method poll() -> Error

Polls the socket, updating its state. See `get_status`.

## Enumerations

> enum Status

> enum_value Status.STATUS_NONE = 0

The initial status of the `StreamPeerSocket`. This is also the status after disconnecting.

> enum_value Status.STATUS_CONNECTING = 1

A status representing a `StreamPeerSocket` that is connecting to a host.

> enum_value Status.STATUS_CONNECTED = 2

A status representing a `StreamPeerSocket` that is connected to a host.

> enum_value Status.STATUS_ERROR = 3

A status representing a `StreamPeerSocket` in error state.
