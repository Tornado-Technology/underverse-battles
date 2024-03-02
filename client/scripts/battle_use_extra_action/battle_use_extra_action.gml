function battle_use_extra_action(attack_index){
	if (instance_exists(obj_edit_button_green)) {
		obj_edit_button_green.press(attack_index);
	}
}