/// @param {String} str
/// @return {String}
function string_to_hash(str) {
	var buffer = buffer_create(1, buffer_grow, buffer_string);
	buffer_write(buffer, buffer_string, str);
	var hash = buffer_sha1(buffer, 0, buffer_get_size(buffer));
	buffer_delete(buffer);
	return hash;
}
