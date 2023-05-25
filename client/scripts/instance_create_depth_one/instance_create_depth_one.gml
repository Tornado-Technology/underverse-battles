/// @descritpion (Warning: Bad optimized function) Creates an object instance similar to instance_create_depth(), only if the number of object instances is 0.
/// @param {Real} x - The x position the object will be created at
/// @param {Real} y - The x position the object will be created at
/// @param {Real} depth - The depth to assign the created instance to
/// @param {Asset.GMObject} object - The object index of the object to create an instance of
/// @param {Struct} var_struct - A structure that contains variables that are copied into the new instance before the Create Event is called
/// @return {Id.Instance}
function instance_create_depth_one(x, y, depth, object, var_struct = undefined) {
	if (instance_exists(object)) {
		return instance_find(object, 0);
	}
	
	if (is_struct(var_struct)) {
        return instance_create_depth(x, y, depth, object, var_struct); 
    }
	
    return instance_create_depth(x, y, depth, object);
}
