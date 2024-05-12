// Camera
camera_set_taget(frisk);

// Room transition
if (is_first_appearance) {
	cutscene_create(cutscenes[0]);
	effect_fade(0, 0.1, 2, c_black, true, fight_depth.ui);
	
	audio_stop_all();
	audio_play_sound(snd_surface, 2, true);
	
	is_first_appearance = true;
	exit;
}

room_start_callback(function() {
	frisk.x = 239;
	frisk.y = 266;
	frisk.sprite_index = standing_up_animation;
	frisk.control();
}, room_underverse_episode_3_muffet_bakery);
room_start_callback(function() {
	frisk.x = 1530;
	frisk.y = 1084;
	frisk.sprite_index = standing_down_animation;
	frisk.control();
}, room_underverse_episode_3_surface, room_underverse_episode_3_muffet_bakery);