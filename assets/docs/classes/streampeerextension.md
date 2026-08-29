# StreamPeerExtension

> class StreamPeerExtension
> inherits StreamPeerExtension StreamPeer

## Methods

> method _get_available_bytes() -> int ; qualifiers=virtual required const

> method _get_data(r_buffer: uint8_t*, r_bytes: int, r_received: int32_t*) -> Error ; qualifiers=virtual

> method _get_partial_data(r_buffer: uint8_t*, r_bytes: int, r_received: int32_t*) -> Error ; qualifiers=virtual

> method _put_data(data: const uint8_t*, bytes: int, r_sent: int32_t*) -> Error ; qualifiers=virtual

> method _put_partial_data(data: const uint8_t*, bytes: int, r_sent: int32_t*) -> Error ; qualifiers=virtual
