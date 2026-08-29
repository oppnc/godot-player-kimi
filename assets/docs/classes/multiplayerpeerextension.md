# MultiplayerPeerExtension

> class MultiplayerPeerExtension ; keywords=network
> inherits MultiplayerPeerExtension MultiplayerPeer

## Brief

Class that can be inherited to implement custom multiplayer API networking layers via GDExtension.

## Description

This class is designed to be inherited from a GDExtension plugin to implement custom networking layers for the multiplayer API (such as WebRTC). All the methods below **must** be implemented to have a working custom multiplayer implementation. See also `MultiplayerAPI`.

## Methods

> method _close() -> void ; qualifiers=virtual required

Called when the multiplayer peer should be immediately closed (see `MultiplayerPeer.close`).

> method _disconnect_peer(peer: int, force: bool) -> void ; qualifiers=virtual required

Called when the connected `peer` should be forcibly disconnected (see `MultiplayerPeer.disconnect_peer`).

> method _get_available_packet_count() -> int ; qualifiers=virtual required const

Called when the available packet count is internally requested by the `MultiplayerAPI`.

> method _get_connection_status() -> MultiplayerPeer.ConnectionStatus ; qualifiers=virtual required const

Called when the connection status is requested on the `MultiplayerPeer` (see `MultiplayerPeer.get_connection_status`).

> method _get_max_packet_size() -> int ; qualifiers=virtual required const

Called when the maximum allowed packet size (in bytes) is requested by the `MultiplayerAPI`.

> method _get_packet(r_buffer: const uint8_t **, r_buffer_size: int32_t*) -> Error ; qualifiers=virtual

Called when a packet needs to be received by the `MultiplayerAPI`, with `r_buffer_size` being the size of the binary `r_buffer` in bytes.

> method _get_packet_channel() -> int ; qualifiers=virtual required const

Called to get the channel over which the next available packet was received. See `MultiplayerPeer.get_packet_channel`.

> method _get_packet_mode() -> MultiplayerPeer.TransferMode ; qualifiers=virtual required const

Called to get the transfer mode the remote peer used to send the next available packet. See `MultiplayerPeer.get_packet_mode`.

> method _get_packet_peer() -> int ; qualifiers=virtual required const

Called when the ID of the `MultiplayerPeer` who sent the most recent packet is requested (see `MultiplayerPeer.get_packet_peer`).

> method _get_packet_script() -> PackedByteArray ; qualifiers=virtual

Called when a packet needs to be received by the `MultiplayerAPI`, if `_get_packet` isn't implemented. Use this when extending this class via GDScript.

> method _get_transfer_channel() -> int ; qualifiers=virtual required const

Called when the transfer channel to use is read on this `MultiplayerPeer` (see `MultiplayerPeer.transfer_channel`).

> method _get_transfer_mode() -> MultiplayerPeer.TransferMode ; qualifiers=virtual required const

Called when the transfer mode to use is read on this `MultiplayerPeer` (see `MultiplayerPeer.transfer_mode`).

> method _get_unique_id() -> int ; qualifiers=virtual required const

Called when the unique ID of this `MultiplayerPeer` is requested (see `MultiplayerPeer.get_unique_id`). The value must be between `1` and `2147483647`.

> method _is_refusing_new_connections() -> bool ; qualifiers=virtual const

Called when the "refuse new connections" status is requested on this `MultiplayerPeer` (see `MultiplayerPeer.refuse_new_connections`).

> method _is_server() -> bool ; qualifiers=virtual required const

Called when the "is server" status is requested on the `MultiplayerAPI`. See `MultiplayerAPI.is_server`.

> method _is_server_relay_supported() -> bool ; qualifiers=virtual const

Called to check if the server can act as a relay in the current configuration. See `MultiplayerPeer.is_server_relay_supported`.

> method _poll() -> void ; qualifiers=virtual required

Called when the `MultiplayerAPI` is polled. See `MultiplayerAPI.poll`.

> method _put_packet(buffer: const uint8_t*, buffer_size: int) -> Error ; qualifiers=virtual

Called when a packet needs to be sent by the `MultiplayerAPI`, with `buffer_size` being the size of the binary `buffer` in bytes.

> method _put_packet_script(buffer: PackedByteArray) -> Error ; qualifiers=virtual

Called when a packet needs to be sent by the `MultiplayerAPI`, if `_put_packet` isn't implemented. Use this when extending this class via GDScript.

> method _set_refuse_new_connections(enable: bool) -> void ; qualifiers=virtual

Called when the "refuse new connections" status is set on this `MultiplayerPeer` (see `MultiplayerPeer.refuse_new_connections`).

> method _set_target_peer(peer: int) -> void ; qualifiers=virtual required

Called when the target peer to use is set for this `MultiplayerPeer` (see `MultiplayerPeer.set_target_peer`).

> method _set_transfer_channel(channel: int) -> void ; qualifiers=virtual required

Called when the channel to use is set for this `MultiplayerPeer` (see `MultiplayerPeer.transfer_channel`).

> method _set_transfer_mode(mode: MultiplayerPeer.TransferMode) -> void ; qualifiers=virtual required

Called when the transfer mode is set on this `MultiplayerPeer` (see `MultiplayerPeer.transfer_mode`).
