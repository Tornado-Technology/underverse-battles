/// @param {Struct} data
/// @param {Id.Socket} socket
function network_write(data, socket = network_client.sock) {
	var buffer = snap_to_messagepack(data);
	var size = buffer_get_size(buffer);
	var new_buffer = buffer_create(size + 4, buffer_fixed, 1);
	
	buffer_write(new_buffer, buffer_u32, size);
	buffer_copy(buffer, 0, size, new_buffer, 4);
	network_send_raw(socket, new_buffer, size + 4);
	buffer_delete(buffer);
	buffer_delete(new_buffer);
}

/// @param {String} index
/// @param {Struct} data
/// @param {Id.Socket} socket
function send(index, data = {}, socket = network_client.socket) {
	data.index = index;
	return network_write(data, socket);
}
