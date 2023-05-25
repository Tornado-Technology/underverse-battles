/// @param {Struct} objects
/// @return {Struct}
function instance_create_struct(objects) {
	var result = {};
	var elements = variable_struct_get_names(objects);
	
	for (var i = 0; i < array_length(elements); i++) {
		result[$ elements[i]] = instance_create(objects[$ elements[i]]);
	}
	
	return result;
}
