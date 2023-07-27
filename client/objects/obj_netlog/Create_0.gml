/// @desc Start and hash liks
ip = netlog_ip;
port = netlog_port;

netlog_init(ip, port);
logger.info($"Netlog start on {ip}:{port}");
