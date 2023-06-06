/// @desc Config ping
sprite_index = noone;
global.ping_instance = id;
send_ping()

value_rfps = fps_real;
color_rfps = c_lime;

show_ping = false;
show_fps_style = 0;

data_updated_handler = on_data_updated.connect(function(args) {
	var key = args[0];
	
	if (key == "Settings.UI.PingStyle") {
		show_ping = data_get("Settings.UI.PingStyle");
		return;
	}
	
	if (key == "Settings.UI.FpsStyle") {
		show_fps_style = data_get("Settings.UI.FpsStyle");
	}
});
data_updated_handler(["Settings.UI.PingStyle"]);
data_updated_handler(["Settings.UI.FpsStyle"]);

disnetwork_connect_interval_timer = Timer(network_disconnect_timeout, function() {
	network_reconnect();
});

network_connect_interval_timer = time_source_create(time_source_game, network_connect_interval, time_source_units_frames, function() {
	if (network_ping != -1) {
		disnetwork_connect_interval_timer.stop(true);
	}
	send_ping();
}, [], -1);
time_source_start(network_connect_interval_timer);

connect_timeout_timer = Timer(network_connect_timeout, function() {
	network_schemes_clear();
	on_network_connection_timeout.invoke();
	disnetwork_connect_interval_timer.start();
	network_ping = -1;
	logger.info("Ping timed out!");
});

