/// @param {array} objs
/// @return {Array<Id.Instance>}
function instance_create_array(objs) {
	var result_array = [];
	for (var i = 0; i < array_length(objs); i++) {
		array_push(result_array, instance_create(objs[i]));
	}
	
	return result_array;
}
