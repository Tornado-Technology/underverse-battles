function statistics_set_selection_attack_network(player_id, attack_num) {
	if (!instance_exists(obj_statistics))
		exit;
	var size = obj_statistics.action_list_size;
	obj_statistics.selected_action[player_id, size] = attack_num;
}