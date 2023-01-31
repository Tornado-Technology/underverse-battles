/// @description reconnect & resolve packet queue

// reconect
if (!connected && !connecting && !global.network_blocking) {
	logger.info("Reconnecting...");
	network_connected = false;
	connect();
}

// create a copy to avoid infinite loops
var _packet_queue = []
array_copy(_packet_queue, 0, packet_queue, 0, array_length(packet_queue))

// clear the queue
packet_queue = []

// go over the queue and potentially fill it back up
for(var i = 0; i < array_length(_packet_queue); ++i) {
	handle_packet(_packet_queue[i])
}