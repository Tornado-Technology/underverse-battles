with(other) {
	if (!is_stunned) audio_play_sound_plugging(snd_spare_up);
	is_stunned = true;
}

if (other.is_otherplayer_soul) exit;

if (time_create_ink == time_create_ink_max) {
	time_create_ink = 0;
	
	repeat(irandom_range(1, 5)) {
		var random_x = irandom_range(0, display_get_gui_width());
		var random_y = irandom_range(0, display_get_gui_height());
		part_particles_create(global.part_system_bullet, random_x, random_y, part_type_ui_ink, 1);
	}
}