/// @desc Description.
/// @param {String} path - Argument0.
function directory_get_hash(path) {
	var buffer = buffer_load(path);
	var hash = buffer_sha1(buffer, 0, buffer_get_size(buffer));
	buffer_delete(buffer);
	return hash;
}
