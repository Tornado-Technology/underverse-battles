function create_other_player_soul(px, py, type) {
	var soul_;
	if (instance_exists(obj_battle_soul_otherplayer)) {
		soul_ = obj_battle_soul_otherplayer;
		
		soul_.change_effect();
		audio_play_sound_once(snd_swing);
	}
	else {
		soul_ = instance_create_depth(px, py, fight_depth.soul, obj_battle_soul_otherplayer);
	}
	switch (type) {
		case battle_soul_type.red:
			soul_.sprite_index = spr_battle_soul_red;
		break;
		case battle_soul_type.orange:
			soul_.sprite_index = spr_battle_soul_orange;
		break;
		case battle_soul_type.blue:
			soul_.sprite_index = spr_battle_soul_blue;
		break;
		case battle_soul_type.yellow:
			soul_.sprite_index = spr_battle_soul_yellow;
		break;
	}
	return soul_;
}