/// @desc
//console_log("Networking event triggered.")
var type = async_load[? "type"]
var buffer = async_load[? "buffer"]

switch(type) {
	case network_type_data:
		// if this is the second half of a packet
		if (buffer_exists(halfpack)) {
			// concat the half packet with the freshly arrived buffer
			var new_buff = buffer_create(buffer_get_size(halfpack) + buffer_get_size(buffer), buffer_fixed, 1);
			buffer_copy(halfpack, 0, buffer_get_size(halfpack), new_buff, 0);
			buffer_copy(buffer, 0, buffer_get_size(buffer), new_buff, buffer_get_size(halfpack));
			
			// This is the most important fix of All Time
			//buffer_delete(buffer);
			buffer = new_buff;
			
			buffer_delete(halfpack);
			halfpack = -1;
			
			//console_log("-half out")
		}
		
		var size = buffer_get_size(buffer);
		var pack_count = 0;

		
		for (var i = 0; i < size;) { // Break up the binary blob into single packets
			// Read the packet size
			if (i + 4 > size) { // cannot read the size bits (outside buffer)
				halfpack = buffer_create(size-i, buffer_fixed, 1);
				buffer_copy(buffer, i, size-i, halfpack, 0);
				//console_log("half in at the size bits-")
				break;
			}
			
			var packSize = buffer_peek(buffer, i, buffer_u32);
			
			// if exceding the packet size
			if (i + packSize > size) {
				halfpack = buffer_create(size-i, buffer_fixed, 1);
				buffer_copy(buffer, i, size-i, halfpack, 0);
				//console_log("half in-")
				break;
			}
			i += 4;
			
			// Read the packet contents
			var pack = buffer_create(packSize, buffer_fixed, 1);
			buffer_copy(buffer, i, packSize, pack, 0);
			
			i += packSize;
			
			try {
				var data = snap_from_messagepack(pack);
				handle_packet(data);
			} catch(error) {
				logger.error("An error occured while parsing the packet: {0}.\nPacket data: {1}.", error.message, data);
			}
			
			pack_count++;
			
			// Clean up
			buffer_delete(pack);
		}
		break;
		
	case network_type_non_blocking_connect:
		if (!async_load[? "succeeded"]) {
			logger.info("Non-blocking connect failed.");
			break;
		} // otherwise fall into the connect case
		
	case network_type_connect:
		logger.info("Connected to the server!");
		
		if (global.network_blocking) {
			disconnect();
			break;
		}
		
		connected = true;
		connecting = false;
		on_connect.invoke();
		send_information();
		break;
		
	case network_type_disconnect:
		logger.info("Disconnected from the server!");
		connected = false;
		connecting = false;
		on_network_disconnect.invoke();
		break;
}
