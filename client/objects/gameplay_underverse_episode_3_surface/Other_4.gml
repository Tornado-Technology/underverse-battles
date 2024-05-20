// Camera
camera_set_taget(frisk);

// Room transition
if (is_first_appearance) {
	cutscene_create(cutscenes[0]);
	effect_fade(0, 0.1, 2, c_black, true, fight_depth.ui);
	
	audio_stop_all();
	audio_play_soundtrack(snd_surface);
	audio_play_soundtrack(snd_park);
	
	is_first_appearance = false;
	exit;
}

room_start_callback(function() {
	frisk.x = 239;
	frisk.y = 266;
	frisk.sprite_index = frisk.standing_up_animation;
	frisk.control();
	sans.x = 239;
	sans.y = 289;
	sans.sprite_index = sans.standing_up_animation;
	sans.follow(frisk);
	audio_stop_sound(snd_park);
}, room_underverse_episode_3_muffet_bakery, room_underverse_episode_3_surface);

room_start_callback(function() {
	frisk.control();
}, room_underverse_episode_3_muffet_bakery);

room_start_callback(function() {
	frisk.x = 1530;
	frisk.y = 1100;
	frisk.sprite_index = frisk.standing_down_animation;
	frisk.control();
	sans.x = 1530;
	sans.y = 1084;
	sans.sprite_index = sans.standing_down_animation;
	sans.follow(frisk);
	audio_play_soundtrack(snd_park);
}, room_underverse_episode_3_surface, room_underverse_episode_3_muffet_bakery);