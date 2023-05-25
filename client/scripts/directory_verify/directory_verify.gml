/// @param {String} path
function directory_verify(path) {
	if (!directory_exists(path)) {
		directory_create(path);
	}
}
