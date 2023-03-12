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

if (fight_player_using_special_action(0)) {
	_hits = irandom_range(2, 7);
	_damage = (inv) ? _hits * dam : _hits * dam * irandom_range(2, 8);
}
else {
	if (irandom_range(0, att + pow + 1) > 0) {
		_hits = (pow == 0) ? pow + 1 : choose(pow, pow + 1);
		_damage = (inv) ? _hits * dam : _hits * dam * irandom_range(2, 8);
	}
	else
		_damage = 0;
}

fight_player_hurt(1, _damage);
	
event_user(12);

if (_damage > 0)
	audio_play_sound_plugging(snd_damage);