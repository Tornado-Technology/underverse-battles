/// @desc Save
if (fight_network_mode && character_initiative != 0) {
	exit;
}

_power = (_power == 4) ? 5 : _power;
var heal_value = 10 * (_power + 1);
fight_enemy_heal(character_initiative, heal_value);
audio_play_sound_plugging(snd_healing);
instance_destroy();
