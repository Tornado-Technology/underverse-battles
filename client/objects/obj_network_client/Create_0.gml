if (network_client != noone) {
	throw new Exception();
}

network_client = id;

ip = "";
port = "";

packet_queue = [];
halfpack = undefined;
socket = undefined;
state = network_client_state.disconnected;
ping = 0;

size_info_bytes = 4;

// Connect/Disconnect events
connecting_failed = new Event();
connecting = new Event();
connected = new Event();
disconnecting = new Event();
disconnected = new Event();
ping_updated = new Event();

/// @param {String} ip
/// @param {String} port
connect = function(ip, port) {
	id.ip = ip;
	id.port = port;
	
	state = network_client_state.connecting;
	socket = socket_create(ip, real(port));
	
	logger.info($"Connecting to {ip}:{port}");
	connecting.invoke(ip, real(port));
}

disconnect = function() {
	state = network_client_state.disconnecting;
	socket_destroy();

	logger.info($"Disconnecting from {ip}:{port}");
	disconnecting.invoke();
	
	// Stupid GMs bugs
	state = network_client_state.disconnected;
	disconnected.invoke();
}

reconnect = function() {
	state = network_client_state.reconnecting;
	
	logger.info($"Reconnecting to {ip}:{port}");
	socket_create();
}

/// @param {Real} time
calculate_ping = function(time) {
	set_ping(round(get_timer() / 1000) - time);
}

/// @param {Real} ping
set_ping = function(ping) {
	id.ping = ping;
	ping_updated.invoke(ping);
}

/// @param {String} ip
/// @param {String} port
/// @retrun {Id.Socket}
socket_create = function(ip, port) {
	socket_destroy();
	socket = network_create_socket(network_socket_tcp);
	network_connect_raw_async(socket, ip, real(port)); // Async = Don't crash the game if the server is down
	return socket;
}

socket_destroy = function() {
	halfpack = undefined;
	set_ping(0);
	if (socket != undefined) {
		network_destroy(socket);
	}
}

ping_update_callback = function() {
	send_ping();
}

disconnect_update_callback = function() {
	disconnect();
}

connecting_update_callback = function() {
	network_client.connect(network_offical_ip, network_offical_port;
}

ping_update = time_source_create(time_source_game, network_ping_interval, time_source_units_seconds, ping_update_callback, [], -1);
disconnect_update = time_source_create(time_source_game, network_disconnect_interval, time_source_units_seconds, disconnect_update_callback, [], -1);

connecting_update = time_source_create(time_source_game, network_connect_interval, time_source_units_seconds, connecting_update_callback, [], -1);
time_source_start(connecting_update);
connecting_update_callback();

// Subscribe
connecting_failed.connect(function() {
	logger.info("Non-blocking connecting failed");
});

connected.connect(function() {
	logger.info("Connected to the server!");
	send_information();
	
	on_network_connect.invoke();
	
	autolog_load();
	
	time_source_start(ping_update);
	time_source_start(disconnect_update);
	time_source_stop(connecting_update);
});

disconnected.connect(function() {
	logger.info("Disconnected from the server!");
	
	network_profile = undefined;
	network_account = undefined;
	on_network_disconnect.invoke();
	
	time_source_stop(ping_update);
	time_source_stop(disconnect_update);
	time_source_start(connecting_update);
});


ping_updated.connect(function(ping) {
	time_source_reset(disconnect_update);
	time_source_start(disconnect_update);
});
