function fight_set_player_input(value) {
	if (!instance_exists(obj_fight_input)) return;
	obj_fight_input.can_select = value;
	return obj_fight_input.can_select;
}

function fight_get_player_input() {
	if (!instance_exists(obj_fight_input)) return;
	return obj_fight_input.can_select;
}

function fight_ui_set_player_can_input_skip(value){
	if (!instance_exists(obj_fight_input)) return;
	obj_fight_input.can_skip = value;
	return obj_fight_input.can_skip;
}

function fight_ui_get_player_can_input_skip(){
	if (!instance_exists(obj_fight_input)) return;
	return obj_fight_input.can_skip;
}
