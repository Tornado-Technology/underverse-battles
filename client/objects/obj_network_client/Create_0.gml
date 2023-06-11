if (network_client != noone) {
	instance_destroy();
	exit;
}

network_client = id;

connect = function() {
	connecting = true;
	connected = false;
	halfpack = -1;
	
	if (variable_instance_exists(id, "socket")) {
		network_destroy(socket);
	}
	
	socket = network_create_socket(network_socket_tcp);
	
	network_connected = true;
	
	// Async = Don't crash the game if the server is down
	network_connect_raw_async(socket, network_offical_ip, real(network_offical_port));
	logger.info("Client started on {0}:{1}", network_offical_ip, real(network_offical_port));
}

disconnect = function() {
	logger.info("Disconnecting...");
	on_network_disconnect.invoke();
	network_connected = false;
	network_destroy(socket);
}

// connect/disconnect events defined in __NetworkingConfig.gml
on_connect = on_network_connect;

global.successful_registration = false;
global.failed_registration = false;

packet_queue = [];

connecting = false;
connected = false;

connect();