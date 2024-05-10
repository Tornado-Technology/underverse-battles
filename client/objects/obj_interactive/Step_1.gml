if (!dialog_created && place_meeting(x, y, target_character) && target_character.is_controlled && input_check_pressed(input.action)) {
	target_character.set_uncontrolled();
	
	var gui_half_height = display_get_gui_height() / 2;
	dialog_instance = dialog_create(dialog_keys[index], target_character.y - target_character.sprite_height - obj_camera.camera_position.y > gui_half_height ? dir.up : dir.down);
	dialog_created = true;
	
	if (!is_last_dialog()) {
		index++;
	}
	
	interact_callback();
}

if (!instance_exists(dialog_instance) && dialog_created) {
	finish_interact_callback();
	
	if (is_destroying && is_last_dialog()) {
		instance_destroy();
	}
}