/// @description Strings
_time++;

// Create border
_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
if (battle_border_start_animation_end()) exit;

// Create soul
_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);

// Attack

if ( _time % 45 == 0) {
	var coord = rand_side_from(_border.x - _border.left - 20, _border.y - _border.up - 20, _border.x + _border.right + 20, _border.y + _border.down + 20);
	var spear_direction = point_direction(coord[0], coord[1], _soul.x, _soul.y);
	instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, obj_spear_green, {
		speed: 2 + _power * 0.2,
		direction: spear_direction,
		image_angle: spear_direction
	});
}

if (_time % 38 - _power * 3 == 0) {
	var coord = [];
	coord = rand_side_from(-1, -1, room_width + 1, room_height + 1);
	
	var thread = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, obj_string_green);
	thread.x_dir = _soul.x;
	thread.y_dir = _soul.y;
	thread.scale_speed = 3.2 + _power * 0.2;
	
	audio_play_sound_plugging(snd_string);
}

if (_time >= 300 + _power * 20) instance_destroy();
