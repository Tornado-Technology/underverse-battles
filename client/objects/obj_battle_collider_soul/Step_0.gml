var place = place_meeting(x, y, obj_battle_bullet) || place_meeting(x, y, obj_battle_pusher);
is_collided = place;

if (cooldown <= 0 && place) {
	cooldown = cooldown_max;
	fight_add_enemy_mana(initiative, mana_give);
	audio_play_sound_plugging(snd_graze);
	
	if (fight_network_mode) {
		send_fight_collider_soul_data();
	}
}

if (cooldown > 0) {
	cooldown--;
}
