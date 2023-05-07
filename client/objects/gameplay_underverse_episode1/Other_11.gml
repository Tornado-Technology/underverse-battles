///@desc Икс Чара забирает душу

if (!instance_exists(dlg))
	start_delay();
	
if (_delay == 150) {
	sans_soul_ = instance_create_depth(player_.x + 20, player_.y - player_.sprite_height / 2, fight_depth.player, obj_scene_soul);
	sans_soul_.sprite_index = spr_monster_soul;
	sans_soul_.animating = false;
	xchara_.sprite_index = spr_xchara_hand_forward;
	xchara_.image_xscale = -1;
}
if (_delay == 170) {	
	sans_soul_.sprite_index = spr_monster_soul_blue;
	audio_play_sound_plugging(snd_swing);
}
if (_delay >= 180 and _delay < 190) {	
	sans_soul_.x += 8;
	player_.x += 8;
	player_.sprite_index = spr_char_sans_controlled;
}
if (_delay == 190) {
	effect_blackout_start(c_black, false, fight_depth.ui_hight);
	audio_play_sound_plugging(snd_soul_division)
	audio_stop_sound(snd_dark_dream);
}
if (_delay == 240) {
	player_.y += 80;
	xchara_.y += 80;
	
	var bg_layer = layer_get_id("Background");
	var bg_ = layer_background_get_id(bg_layer);
	layer_background_sprite(bg_, spr_background_underverse_forest);
	
	audio_play_sound(snd_fallen_child, 1, true, 0.5);
}
if (_delay == 270) {
	player_.x = room_width - 340;
	player_.sprite_index = spr_char_sans_defeated;
	
	xchara_.x = room_width - 230;
	xchara_.sprite_index = spr_xchara_get_soul;
	
	instance_destroy(sans_soul_);
	
	sans_soul_half_1 = instance_create_depth(xchara_.x + xchara_.sprite_width / 2 - 6, xchara_.y - 25, fight_depth.player, obj_scene_soul);
	scene_soul_set_sprite(sans_soul_half_1, spr_monster_soul_half2);
	
	sans_soul_half_ = instance_create_depth(player_.x + 16, player_.y - player_.sprite_height / 2, fight_depth.player, obj_scene_soul);
	scene_soul_set_sprite(sans_soul_half_, spr_monster_soul_half1);
	effect_blackout_end();
}
if (_delay == 350) {
	dlg = dialog_create(episode + "Dialog2");
	dlg.shift = 0;
	pause_delay();
	scenario = 2;
}

if (is_mobile || mobile_mode) {
	global.__ui_controls_instance.enable = false;
}