initiative = fight_get_initiative();

time_source_heal = time_source_create(time_source_game, 0.4, time_source_units_seconds, function() {
	if (initiative == 0) {
		var lost_hp = character_instance.max_hp - character_instance.hp;
		var heal_value = character_instance.mana > lost_hp ? lost_hp : character_instance.mana;
		fight_player_heal(initiative, heal_value);
		fight_add_player_mana(initiative, -heal_value);
		audio_play_sound_plugging(snd_healing);
		
		if (fight_network_mode) send_fight_mana(-heal_value);
	}
	instance_destroy();
});
time_source_start(time_source_heal);