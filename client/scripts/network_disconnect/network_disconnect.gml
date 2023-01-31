function network_disconnect(auto_reconnect = false) {
	network_client.disconnect();
	if (!auto_reconnect) return;
	network_reconnect();
}
