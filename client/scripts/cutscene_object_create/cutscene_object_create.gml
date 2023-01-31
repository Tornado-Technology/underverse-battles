function cutscene_object_create(object, instance_x, instance_y, instance_depth, callback) {
	var instance = instance_create_depth(instance_x, instance_y, instance_depth, object);
	callback(instance);
	return true;
}
