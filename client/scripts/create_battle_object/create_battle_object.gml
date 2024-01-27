function create_battle_object(x, y, depth, object, var_struct = {}, send_data = false) {
	if (send_data) send_battle_object(x, y, depth, object, var_struct);
	
	return instance_create_depth(x, y, depth, object, var_struct);
}