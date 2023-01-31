function fight_set_player_input(_input) {
	if (!instance_exists(obj_fight_input)) return;
	obj_fight_input.can_select = _input;
	return obj_fight_input.can_select;
}

function fight_get_player_input() {
	if (!instance_exists(obj_fight_input)) return;
	return obj_fight_input.can_select;
}

function fight_ui_set_player_can_input_skip(val){
	if (!instance_exists(obj_fight_input)) return;
	obj_fight_input.can_skip = val;
	return obj_fight_input.can_skip;
}

function fight_ui_get_player_can_input_skip(){
	if (!instance_exists(obj_fight_input)) return;
	return obj_fight_input.can_skip;
}
