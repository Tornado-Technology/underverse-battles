function statistics_set_selection_attacks(attack0, attack1){
	var size = obj_statistics.action_list_size;
	obj_statistics.selected_action[0, size] = attack0;
	obj_statistics.selected_action[1, size] = attack1;
	obj_statistics.initiative[size] = fight_get_initiative();
	obj_statistics.action_list_size++;
}