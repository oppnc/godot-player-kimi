# PacketPeerStream

> class PacketPeerStream
> inherits PacketPeerStream PacketPeer

## Brief

Wrapper to use a PacketPeer over a StreamPeer.

## Description

PacketStreamPeer provides a wrapper for working using packets over a stream. This allows for using packet based code with StreamPeers. PacketPeerStream implements a custom protocol over the StreamPeer, so the user should not read or write to the wrapped StreamPeer directly.
**Note:** When exporting to Android, make sure to enable the `INTERNET` permission in the Android export preset before exporting the project or using one-click deploy. Otherwise, network communication of any kind will be blocked by Android.

## Properties

> property input_buffer_max_size : int ; default=65532 ; setter=set_input_buffer_max_size ; getter=get_input_buffer_max_size

> property output_buffer_max_size : int ; default=65532 ; setter=set_output_buffer_max_size ; getter=get_output_buffer_max_size

> property stream_peer : StreamPeer ; setter=set_stream_peer ; getter=get_stream_peer

The wrapped `StreamPeer` object.
