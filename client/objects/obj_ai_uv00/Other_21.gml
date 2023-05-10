///@desc damage
var inv = fight_get_player(0).invulnerability;
var dam = fight_get_player(0).damage;
var pow = fight_get_player_power(0);
var att = 0;

_hits = 0;
_damage = 0;
if (fight_get_player_action(0) == 0)
	att = 1;
if (fight_get_player_action(0) == 1)
	att = irandom_range(1, 2);
if (fight_get_player_action(0) == 2)
	att = 2;
if (fight_get_player_action(0) == 3)
	exit;

if (pow == 0) {
	_hits = 3;
	_damage = irandom_range(8, 16);
}
else {
	_hits = 4;
	_damage = irandom_range(18, 30);
}
	
fight_player_hurt(1, _damage);

event_user(12);

if (_damage > 0)
	audio_play_sound_plugging(snd_damage);
