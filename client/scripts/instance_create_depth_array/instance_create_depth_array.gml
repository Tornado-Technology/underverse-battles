/// @param {real} x
/// @param {real} y
/// @param {real} depth
/// @param {array} objs
function instance_create_depth_array(_x, _y, _depth, _objs) {
	var result_array = [];
	for (var i = 0; i < array_length(_objs); i++) {
		array_push(result_array, instance_create_depth(_x, _y, _depth, _objs[i]));
	}
	return result_array;
}