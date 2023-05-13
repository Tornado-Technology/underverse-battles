function statistics_set_next_step_network() {
	if (!instance_exists(obj_statistics))
		exit;
	var size = obj_statistics.action_list_size;
	obj_statistics.initiative[size] = fight_get_initiative();
	obj_statistics.action_list_size++;
}