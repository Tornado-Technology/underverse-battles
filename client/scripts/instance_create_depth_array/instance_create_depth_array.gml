/// @param {Real} x
/// @param {Real} y
/// @param {Real} depth
/// @param {Array} objects
/// @return {Array<Id.Instance>}
function instance_create_depth_array(x, y, depth, objects) {
	var result_array = [];
	
	for (var i = 0; i < array_length(objects); i++) {
		array_push(result_array, instance_create_depth(x, y, depth, objects[i]));
	}
	
	return result_array;
}