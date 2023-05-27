/// @desc Save
if (fight_network_mode && character_initiative != 0) {
	exit;
}

time_source_border_delay = time_source_create(time_source_game, 1/60, time_source_units_seconds, function () {
	var lost_hp = character_instance.max_hp - character_instance.hp;
	var heal_value = character_instance.mana > lost_hp ? lost_hp : character_instance.mana;
	fight_player_heal(character_initiative, heal_value);
	fight_add_player_mana(character_initiative, -heal_value);
	audio_play_sound_plugging(snd_healing);
	instance_destroy();
});
time_source_start(time_source_border_delay);