// Allow up to 4000 ping (YYG recommends ~1000 for LAN-only games)
network_set_config(network_config_use_non_blocking_socket, true)
network_set_config(network_config_connect_timeout, 4000);

// Server vars in client
enum client_state {
    undef,
    in_menu,
    wait_fight,
    in_fight,
    wait_world,
    in_world,
	any = -1
}

// Globals
global.network_blocking = false;
global.__network_ping = -1;
global.__network_account = undefined;
global.__network_profile = undefined;
global.__network_connected = false;
global.__instance_network_client = noone;
global.__event_on_network_connect = new Event();
global.__event_on_network_disconnect = new Event();
global.__event_on_network_login = new Event();

// Macros
#macro Default:network_offical_ip "82.146.34.152"
#macro Development:network_offical_ip "82.146.34.152"
#macro Localhost:network_offical_ip "localhost"
#macro Default:network_offical_port "1338"
#macro Development:network_offical_port "1337"
#macro network_connect_interval 120
#macro network_connect_timeout 420
#macro network_disconnect_timeout 600
#macro network_autolog_file (working_directory + "autolog.acc")

#macro network_client global.__instance_network_client
#macro network_account global.__network_account
#macro network_profile global.__network_profile
#macro network_connected global.__network_connected
#macro network_ping global.__network_ping

#macro on_network_connect global.__event_on_network_connect
#macro on_network_disconnect global.__event_on_network_disconnect
#macro on_network_login global.__event_on_network_login

// Connections
on_network_connect.connect(function() {
	autolog_load();
	network_account = undefined;
	network_profile = undefined;
});

on_network_disconnect.connect(function() {
	network_account = undefined;
	network_profile = undefined;
});

on_network_login.connect(function(args) {
	if (args[0] == "success") {
		achievement_give(achievement_id.a_cybers_world);
	}
});
