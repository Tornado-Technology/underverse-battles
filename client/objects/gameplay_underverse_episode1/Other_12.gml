///@desc Появление Инка

if (!instance_exists(dlg))
	start_delay();
	
if (_delay == 150) {
	ink_sans_ = instance_create_depth(player_.x - 250, player_.y - 80, fight_depth.enemy, obj_char_ink_sans);
	ink_sans_.sprite_index = spr_char_ink_sans_flip;
}

if (_delay > 150 and _delay < 225) {
	if (ink_sans_.y <  player_.y)
		ink_sans_.x += 4;
	ink_sans_.y = approach(ink_sans_.y, player_.y, 2);
}

if (_delay == 180) {
	flying_inks_ = instance_create_depth(ink_sans_.x, ink_sans_.y - 15, fight_depth.enemy - 1, obj_npc);
	flying_inks_.sprite_index = spr_flying_inks;
	audio_play_sound_plugging(snd_stab);
}

if (_delay > 180 and _delay < 208) {
	flying_inks_.x = approach(flying_inks_.x, xchara_.x, 10);
	flying_inks_.y = approach(flying_inks_.y, xchara_.y + 25, 0.8);
}

if (_delay > 203 and _delay < 210) {
	xchara_.x = approach(xchara_.x, room_width - 220, 1);
	xchara_.sprite_index = spr_xchara_in_inks;
	instance_destroy(sans_soul_half_1);
}

if (_delay == 208) {
	instance_destroy(flying_inks_);
	audio_play_sound_plugging(snd_damage);
	audio_stop_sound(snd_fallen_child);
}

if (_delay == 240) {
	dlg = dialog_create(episode + "Dialog3");
	dlg.shift = 0;
	pause_delay();
	scenario = 3;
}