/// @param {Struct} struct
/// @return {Array<Any>}
function struct_get_values(struct) {
	var array = [];
	var names = struct_get_names(struct);
	var length = array_length(names);
	
	for (var i = 0; i < length; i++) {
		array_push(array, struct[$names[i]]);
	}
	
	return array;
}