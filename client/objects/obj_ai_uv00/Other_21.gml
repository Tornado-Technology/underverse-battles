///@desc damage
var inv = fight_get_enemy(0).invulnerability;
var dam = fight_get_enemy(0).damage;
var pow = fight_get_enemy_power(0);
var att = 0;

_damage = 0;
if (fight_get_enemy_action(0) == 0)
	att = 1;
if (fight_get_enemy_action(0) == 1)
	att = irandom_range(1, 2);
if (fight_get_enemy_action(0) == 2)
	att = 2;
if (fight_get_enemy_action(0) == 3)
	exit;
	
event_user(12);

if (pow == 0) {
	_damage = irandom_range(8, 16);
}
else
	_damage = irandom_range(18, 30);

if (_damage > 0)
	audio_play_sound_plugging(snd_damage);
