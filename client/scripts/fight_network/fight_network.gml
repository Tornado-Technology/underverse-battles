/// @param enemy_id
/// @param value
function fight_network_damage(_enemyId, _damage){
	audio_play_sound_plugging(snd_soul_damage);
	fight_draw_damage_number(_enemyId, _damage);
	battle_add_damage(_damage);
	return true;
}

/// @param {number} enemy_id
/// @param {number} value
function fight_network_heal(_enemyId, _heal){
	audio_play_sound_plugging(snd_healing);
	fight_draw_damage_number(_enemyId, -_heal);
	battle_remove_damage(_heal);
	return true;
}

/// @param {number} enemy_id
function fight_network_stun(_enemyId){
	if (instance_exists(obj_battle_soul_otherplayer)) {
		if (!obj_battle_soul_otherplayer.is_stunned)
			audio_play_sound_plugging(snd_spare_up);
	
		obj_battle_soul_otherplayer.is_stunned = true;
		return true;
	}
	return false;
}

/// @param {Real} enemy_id
function fight_network_collider(_enemyId){
	if (instance_exists(obj_battle_soul_otherplayer)) {
		if (!obj_battle_soul_otherplayer.collider_soul.is_collided)
			obj_battle_soul_otherplayer.collider_soul.is_collided = true;
		return true;
	}
	return false;
}

/// @param {number} enemy_id
function fight_network_disconnect(_enemyId){
	display_show_message_info(opponent_get_name(_enemyId) + " " + translate_get("Battle.Disconnected"), c_red);
	if (global.fight_instance != noone)
		global.fight_instance.enemy_death_id = _enemyId;
	statistics_set_rating_points(-1);
	return true;
}

/// @param {bool} isWinner
function fight_network_finished(isWinner, rating) {
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.END_STATE, isWinner ? gameover.win :  gameover.lose);
	if (global.fight_instance != noone) {
		global.fight_instance.enemy_death_id = isWinner ? 1 : 0;
		global.fight_instance.battle_death_animation = true;
	}
	statistics_set_rating_points(isWinner, rating);
	return true;
}
