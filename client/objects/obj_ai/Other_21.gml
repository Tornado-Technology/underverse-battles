///@desc damage
var inv = fight_get_player(0).invulnerability;
var dam = fight_get_player(0).damage;
var pow = fight_get_player_power(0);
var hp_att = 200 div fight_get_player_max_hp(0);
var att = 0;

_hits = 0;
_damage = 0;
if (fight_get_player_attack(0) == 0)
	att = 1;
if (fight_get_player_attack(0) == 1)
	att = irandom_range(1, 2);
if (fight_get_player_attack(0) == 2)
	att = 2;
	
att += hp_att;

if (fight_player_using_special_action(0)) {
	_hits = irandom_range(3, 7);
	_damage = (inv) ? _hits * dam : _hits * dam * irandom_range(4, 7);
}
else {
	if (irandom_range(0, att + pow + 1) > 0) {
		_hits = choose(pow + 1, pow + hp_att + 1);
		_damage = (inv) ? _hits * dam : _hits * dam * irandom_range(2, 8);
	}
	else
		_damage = 0;
}

fight_player_hurt(1, _damage);
	
event_user(12);

if (_damage > 0)
	audio_play_sound_plugging(snd_damage);