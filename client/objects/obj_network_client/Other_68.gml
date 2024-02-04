var type = async_load[? "type"];
var buffer = async_load[? "buffer"];

switch (type) {
	
	case network_type_data:

	// If this is the second half of a packet
	if (buffer_exists(halfpack)) {
		// Concat the half packet with the freshly arrived buffer
		var new_buff = buffer_create(buffer_get_size(halfpack) + buffer_get_size(buffer), buffer_fixed, 1);
		buffer_copy(halfpack, 0, buffer_get_size(halfpack), new_buff, 0);
		buffer_copy(buffer, 0, buffer_get_size(buffer), new_buff, buffer_get_size(halfpack));
			
		// This is the most important fix of All Time
		buffer = new_buff;
		buffer_delete(halfpack);
		halfpack = -1;
	}
		
	var size = buffer_get_size(buffer);
	var pack_count = 0;
		
	for (var i = 0; i < size;) { // Break up the binary blob into single packets
		// Read the packet size
		if (i + size_info_bytes > size) { // Cannot read the size bits (outside buffer)
			halfpack = buffer_create(size - i, buffer_fixed, 1);
			buffer_copy(buffer, i, size - i, halfpack, 0);
			break;
		}

		var packet_size = buffer_peek(buffer, i, buffer_u32);
			
		// If exceding the packet size
		if (i + size_info_bytes + packet_size > size) {
			halfpack = buffer_create(size - i, buffer_fixed, 1);
			buffer_copy(buffer, i, size - i, halfpack, 0);
			break;
		}
		
		i += size_info_bytes;
			
		// Read the packet contents
		var pack = buffer_create(packet_size, buffer_fixed, 1);
		buffer_copy(buffer, i, packet_size, pack, 0);
			
		i += packet_size;
			
		try {
			var data = snap_from_messagepack(pack);
			handle_packet(data);
		} catch(error) {
			logger.error($"An error occured while parsing the packet: {error.message}.\nPacket data: {data}.");
		}
			
		pack_count++;
			
		// Clean up
		buffer_delete(pack);
	}
	break;
		
	case network_type_non_blocking_connect:
		if (!async_load[? "succeeded"]) {
			connecting_failed.invoke();
			break;
		} // Otherwise fall into the connect case
		
	case network_type_connect:
		state = network_client_state.connected;	
		connected.invoke();
		break;
		
	case network_type_disconnect:
		state = network_client_state.disconnected;
		disconnected.invoke();
		break;
}
