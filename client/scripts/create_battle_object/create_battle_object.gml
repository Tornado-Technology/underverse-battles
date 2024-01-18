function create_battle_object(x, y, depth, object, var_struct = {}, send_object_creation = false) {
	if (send_object_creation) send_battle_object(x, y, depth, object, var_struct);
	
	return instance_create_depth(x, y, depth, object, var_struct);
}