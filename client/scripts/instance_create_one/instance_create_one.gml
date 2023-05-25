/// @description Creates an object instance similar to instance_create_depth_one, but creates at x: 0, y: 0, depth: 0.
/// @param {asset.GMObject} object - The object index of the object to create an instance of
/// @param {Struct} var_struct - A structure that contains variables that are copied into the new instance before the Create Event is called
/// @return {Id.Instance}
function instance_create_one(object, var_struct = undefined) {
	return instance_exists(object) ? instance_find(object, 0) : instance_create(object, var_struct);
}
