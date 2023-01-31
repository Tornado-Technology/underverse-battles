/// @desc Creates an object instance similar to instance_create_depth(), but creates at x: 0, y: 0, depth: 0.
/// @param {Asset.GMObject} obj The object index of the object to create an instance of
/// @param {Struct} var_struct A structure that contains variables that are copied into the new instance before the Create Event is called
function instance_create(obj, var_struct = undefined) {
    if (is_struct(var_struct)) {
        return instance_create_depth(0, 0, 0, obj, var_struct);    
    }
	
    return instance_create_depth(0, 0, 0, obj);
}
