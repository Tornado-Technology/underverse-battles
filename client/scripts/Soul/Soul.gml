function create_soul(px, py, type, send_data = fight_network_mode) {
	if (instance_exists(obj_battle_soul)) {
		if (send_data) send_battle_soul(obj_battle_soul.x, obj_battle_soul.y, type);
		return change_soul(obj_battle_soul, obj_battle_soul.x, obj_battle_soul.y, type, send_data);
	}
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
	if (send_data) send_battle_soul(px, py, type);
	return instance_create_depth(px, py, fight_depth.soul, soul_);
}

function change_soul(old_soul, px, py, type, send_data) {
	if (old_soul.color_type == type) return;
	
	instance_destroy(old_soul);
	audio_play_sound_once(snd_swing);
	var new_soul = create_soul(px, py, type, send_data);
	new_soul.change_effect();
	return new_soul;
}
