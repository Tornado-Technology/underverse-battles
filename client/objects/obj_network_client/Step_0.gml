/// @description Resolve packet queue
// Create a copy to avoid infinite loops
var new_packet_queue = [];
array_copy(new_packet_queue, 0, packet_queue, 0, array_length(packet_queue));

// Clear the queue
packet_queue = [];

// Go over the queue and potentially fill it back up
var i = 0;
repeat (array_length(new_packet_queue)) {
	handle_packet(new_packet_queue[i]);
	i++;
}
