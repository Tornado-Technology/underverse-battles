function network_reconnect() {
	if (global.network_blocking) {
		return;
	}
	
    logger.info("Reconnecting...");
	
	if (global.fight_instance != noone && fight_network_mode) {
		global.fight_instance = noone;
		fight_network_finished(-1, 0);
		room_goto(room_fight_1v1_end);
	}
	
	network_client.disconnect();
	
    network_client.connect(network_offical_ip, network_offical_port);
}