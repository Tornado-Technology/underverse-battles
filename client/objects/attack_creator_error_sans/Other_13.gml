/// @description Panic attack
_time++;

_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
if (battle_border_start_animation_end()) exit;

_soul = create_soul(_border.x, _border.y, battle_soul_type.red);

// Bones
var period = 4;
var time_limit = 240;
if (_time % period == 1 && _time <= time_limit) {
	var random_side = irandom_range(0, 1);
	var random_x = _border.x - _border.left - 10;
	var random_y = irandom_range(_border.y - _border.up, _border.y + _border.down);
	var random_direction = 0;
	if (random_side == 0) {
		random_x = _border.x + _border.right + 10;
		random_direction = 180;
	}
	create_bone(random_x, random_y, bone_obj, 3, 1, random_direction, random_direction - 90);
	audio_play_sound_plugging(snd_projectile);
}

// Gasterblasters
period = 40;
var time_delay = time_limit + 30;
var amount = 6;
if (_time % period == 1 && _time > time_delay && _time <= time_delay + period * amount) {
	repeat (3) { create_aiming_gasterblaster(obj_gasterblaster_aiming_error_sans, _soul); }
}

time_limit = 580;
if(_time >= time_limit) instance_destroy();