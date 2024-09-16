///@desc Начало

if (player_.x >= room_width - 480) {
	/* Player */
	player_.set_uncontrolled();
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