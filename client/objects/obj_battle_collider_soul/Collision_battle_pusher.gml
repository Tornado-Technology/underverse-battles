if (cooldown <= 0) {
	fight_add_enemy_mana(fight_get_next_iniciative(), 2);
	cooldown = cooldown_max;
	play_single_sound(SND_VOICE_DEMON);
}