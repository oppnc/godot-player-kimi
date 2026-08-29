# PacketPeerExtension

> class PacketPeerExtension
> inherits PacketPeerExtension PacketPeer

## Methods

> method _get_available_packet_count() -> int ; qualifiers=virtual required const

> method _get_max_packet_size() -> int ; qualifiers=virtual required const

> method _get_packet(r_buffer: const uint8_t **, r_buffer_size: int32_t*) -> Error ; qualifiers=virtual

> method _put_packet(buffer: const uint8_t*, buffer_size: int) -> Error ; qualifiers=virtual
