function create_soul(px, py, type) {
	if (instance_exists(obj_battle_soul)) return obj_battle_soul;
	if (fight_get_initiative() != 0) {
		var soul_ = obj_battle_soul_standart;
		switch (type) {
			case battle_soul_type.red:
				soul_ = obj_battle_soul_standart;
			break;
			case battle_soul_type.orange:
				soul_ = obj_battle_soul_orange;
			break;
			case battle_soul_type.blue:
				soul_ = obj_battle_soul_blue;
			break;
			case battle_soul_type.yellow:
				soul_ = obj_battle_soul_yellow;
			break;
		}
		return instance_create_depth(px, py, fight_depth.soul, soul_);
	}
	else {
		var soul_ = instance_create_depth(px, py, fight_depth.soul, obj_battle_soul_otherplayer);
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
}

function change_soul(old_soul, px, py, type) {
	instance_destroy(old_soul);
	audio_play_sound_once(snd_swing);
	var new_soul = create_soul(px, py, type);
	new_soul.change_effect();
	return new_soul;
}

function fight_set_soul_data(playerId, px, py, angle, ability) {
	if (!instance_exists(obj_battle_soul_otherplayer)) return;
	var soul = obj_battle_soul_otherplayer;
	soul.next_x = px;
	soul.next_y = py;
	soul.image_angle = angle;
	soul.ability = ability;
}
