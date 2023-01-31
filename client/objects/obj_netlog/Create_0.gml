/// @desc Start and hash liks
if (!netlog_enabled) {
	logger.info("Netlog start stopped, resone: disabled in __GameConfig.");
	instance_destroy();
	exit;
}

ip = netlog_ip;
port = netlog_port;

netlog_init(ip, port);
logger.info("Netlog start on {0}:{1}", ip, port);
