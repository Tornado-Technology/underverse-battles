function create_battle_object(x, y, depth, object, var_struct = {}, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object(x, y, depth, object, var_struct, storage_index);
	
	return instance_create_depth(x, y, depth, object, var_struct);
}