///@desc Начало

if (player_.x >= room_width - 480) {
	/* Player */
	player_.moveable = false;
	player_.sprite_index = spr_char_sans_idle;
	
	/* Camera */
	camera_set_speed(1, 1);
	camera_set_overwrite_position(room_width - 560, y);
	
	start_delay();
}

if (_delay == 150)
{
	dlg = dialog_create(episode + "Dialog1", dir.down);
	pause_delay();
	scenario = 1;
}

if (is_mobile || mobile_mode) {
	global.__ui_controls_instance.enable = true;
}