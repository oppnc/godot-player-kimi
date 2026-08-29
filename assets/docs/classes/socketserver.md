# SocketServer

> class SocketServer
> inherits SocketServer RefCounted

## Brief

An abstract class for servers based on sockets.

## Description

A socket server.

## Methods

> method is_connection_available() -> bool ; qualifiers=const

Returns `true` if a connection is available for taking.

> method is_listening() -> bool ; qualifiers=const

Returns `true` if the server is currently listening for connections.

> method stop() -> void

Stops listening.

> method take_socket_connection() -> StreamPeerSocket

If a connection is available, returns a StreamPeerSocket with the connection.
