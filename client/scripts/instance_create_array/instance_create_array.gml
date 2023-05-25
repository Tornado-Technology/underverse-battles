/// @param {Array} objects
/// @return {Array<Id.Instance>}
function instance_create_array(objects) {
	var result_array = [];
	
	for (var i = 0; i < array_length(objects); i++) {
		array_push(result_array, instance_create(objects[i]));
	}
	
	return result_array;
}
