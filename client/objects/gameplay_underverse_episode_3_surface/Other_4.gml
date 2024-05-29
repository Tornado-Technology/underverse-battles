// Persistent
//room_set_persistent(room_underverse_episode_3_surface, true);
//room_set_persistent(room_underverse_episode_3_muffet_bakery, true);
//room_set_persistent(room_underverse_episode_3_ketchup_shop, true);

// Room transition
if (is_first_appearance) {
	instance_create(obj_inventory);
	
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
	frisk.control();
	frisk.direction = dir.up;
	sans.x = 239;
	sans.y = 289;
	sans.follow(frisk);
	sans.direction = dir.up;
	audio_stop_sound(snd_park);
}, room_underverse_episode_3_muffet_bakery, room_underverse_episode_3_surface);

room_start_callback(function() {
	frisk.control();
}, room_underverse_episode_3_muffet_bakery);

room_start_callback(function() {
	frisk.x = 1530;
	frisk.y = 1100;
	frisk.control();
	frisk.direction = dir.down;
	sans.x = 1530;
	sans.y = 1084;
	sans.follow(frisk);
	sans.direction = dir.down;
	audio_play_soundtrack(snd_park);
}, room_underverse_episode_3_surface, room_underverse_episode_3_muffet_bakery);

room_start_callback(function() {
	frisk.x = 239;
	frisk.y = 266;
	frisk.control();
	frisk.direction = dir.up;
	sans.x = 239;
	sans.y = 289;
	sans.follow(frisk);
	sans.direction = dir.up;
	audio_stop_sound(snd_park);
}, room_underverse_episode_3_ketchup_shop, room_underverse_episode_3_surface);

room_start_callback(function() {
	frisk.control();
}, room_underverse_episode_3_ketchup_shop);

room_start_callback(function() {
	frisk.x = 1916;
	frisk.y = 1100;
	frisk.control();
	frisk.direction = dir.down;
	sans.x = 1916;
	sans.y = 1084;
	sans.follow(frisk);
	sans.direction = dir.down;
	audio_play_soundtrack(snd_park);
}, room_underverse_episode_3_surface, room_underverse_episode_3_ketchup_shop);