function statistics_set_selection_attacks(attack0, attack1){
	if (instance_exists(obj_statistics)) {
		array_push(obj_statistics.selection_attacks_0, attack0);
		array_push(obj_statistics.selection_attacks_1, attack1);
		array_push(obj_statistics.initiative, fight_get_initiative());
		return true;
	}
	return false;
}