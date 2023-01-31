/// @param {struct} objs
/// @return {array<Id.Instance>}
function instance_create_struct(objs) {
	var result_array = [];
	var elements = variable_struct_get_names(objs);
	for (var i = 0; i < array_length(elements); i++) {
		array_push(result_array, instance_create(objs[$ elements[i]]));
	}
	
	return result_array;
}
