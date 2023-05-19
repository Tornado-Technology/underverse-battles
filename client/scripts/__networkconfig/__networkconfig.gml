// Allow up to 4000 ping (YYG recommends ~1000 for LAN-only games)
network_set_config(network_config_use_non_blocking_socket, true)
network_set_config(network_config_connect_timeout, 4000);

// Server vars in client
enum client_state {
  undefined,
  in_menu,
  wait_fight,
  in_fight,
  wait_world,
  in_world,
}

enum account_type {
  user = 0,
  beta_tester = 1,
  administrator = 2,
  developer = 3,
}

enum status_code {
	error = 0,
	success = 1,
	serverSocketClosed = 2,
	databaseError = 300,
	databaseNotConnected = 301,
	databaseDisable = 302,
	databaseAccountNotExists = 303,
	databaseAccountExists = 304,
	databaseProfileNotExists = 305,
	databaseProfileExists = 306,
	databaseUsernameBusy = 307,
	databaseUsernameWrong = 308,
	databasePasswordWrong = 309,
	databaseEmailBusy = 310,
	databaseEmailWrong = 311,
	databaseVerificationWrongCode = 312,
	databaseVerificationTimeout = 313,
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
global.__on_network_connection_timeout = new Event();

// Macros
#macro Default:network_offical_ip "82.146.34.152"
#macro Development:network_offical_ip "82.146.34.152"
#macro Localserver:network_offical_ip "192.168.168.220"
#macro Cinematic:network_offical_ip "82.146.34.152"
#macro Mobile:network_offical_ip "82.146.34.152"
#macro SpecialAttackTest:network_offical_ip "82.146.34.152"
#macro Default:network_offical_port "1338"
#macro Development:network_offical_port "1337"
#macro Localserver:network_offical_port "1337"
#macro Cinematic:network_offical_port "1337"
#macro Mobile:network_offical_port "1337"
#macro SpecialAttackTest:network_offical_port "1337"
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
#macro on_network_connection_timeout global.__on_network_connection_timeout

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
	if (args[0] == status_code.success) {
		achievement_give(achievement_id.a_cybers_world);
	}
});
