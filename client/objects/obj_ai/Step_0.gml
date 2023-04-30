if (fight_get_initiative() != 1 || fight_get_player(1) == obj_character_green) exit;

if (instance_exists(obj_edit_button_green)) {
	delay_extra += dtime;
	if (delay_extra >= period) {
		obj_edit_button_green.press();
		change_period();
	}
}