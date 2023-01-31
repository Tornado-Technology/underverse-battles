/// @param {Struct} data
function queue_packet(data) {
	if (!variable_instance_exists(network_client, "packet_queue")) {
		network_client.packet_queue = []
	}
	
	array_push(network_client.packet_queue, data)
}