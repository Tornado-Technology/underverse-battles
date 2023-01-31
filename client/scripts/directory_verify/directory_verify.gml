/// @param {String} path
function directory_verify(path) {
	if (directory_exists(path)) return path;
	
	directory_create(path);
	
	return path;
}