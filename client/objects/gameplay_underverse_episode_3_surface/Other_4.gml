// Room transition
if (is_first_appearance) {
	instance_create(obj_inventory);
	
	camera_set_taget(frisk);
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
	frisk.x = 223;
	frisk.y = 204;
	frisk.control();
	frisk.direction = dir.up;
	sans.x = 223;
	sans.y = 222;
	sans.follow(frisk);
	sans.direction = dir.up;
}, room_underverse_episode_3_muffet_bakery, room_shop_muffet_bakery);

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
	frisk.x = 204;
	frisk.y = 204;
	frisk.control();
	frisk.direction = dir.up;
	sans.x = 204;
	sans.y = 222;
	sans.follow(frisk);
	sans.direction = dir.up;
}, room_underverse_episode_3_ketchup_shop, room_shop_ketchup_shop);

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
	
	if (frisk_was_in_ketchup_shop) {
		instance_create_depth(asgore.x, asgore.y + 16, fight_depth.player, obj_grill);
		instance_destroy(inst_interactive_episode3_asgore);
		instance_destroy(asgore);
		asgore = instance_create_depth(441, 2912, fight_depth.player, obj_npc_asgore, {
			sprite_index: spr_asgore_picnic_standing_right
		});
		papyrus.sprite_index = spr_papyrus_picnic_sitting_right;
		undyne.sprite_index = spr_undyne_picnic_sitting_down;
		toriel.sprite_index = spr_toriel_picnic_sitting_left;
	}
}, room_underverse_episode_3_surface, room_underverse_episode_3_ketchup_shop);