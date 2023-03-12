if (live_call()) {
    return live_result;
}

/// @description Bone veil
_time++;

// Create border
_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
if (battle_border_start_animation_end()) exit;
		
// Create soul
_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);

var final_time = 400;

if(_time % 120 == 1 && _time < final_time) {
	var bone_speed = 1;
	var bone_size = 8.3;
	create_bone(_border.x - _border.left - 4, _border.y + _border.down, bone_obj, bone_speed, bone_size, 0, 0);
	create_bone(_border.x + _border.right + 4, _border.y + _border.down, bone_obj, bone_speed, bone_size, 180, 0);
	create_bone(_border.x + _border.right, _border.y + _border.down + 4, bone_obj, bone_speed, bone_size, 90, 90);
	create_bone(_border.x + _border.right, _border.y - _border.up - 4, bone_obj, bone_speed, bone_size, 270, 90);
}

if(_time % 60 == 1 && _time < final_time) {
	var bone_speed = 2.2;
	var bone_size = 1;
	var rand_side = irandom_range(0, 3);
	var bone_x = _border.x - _border.left - 10;
	var bone_y = _border.y + _border.down + 10;
	if (rand_side == 1) {
		bone_x = _border.x + _border.right + 10;
		bone_y = _border.y - _border.up - 10;
	}
	if (rand_side == 2) {
		bone_x = _border.x + _border.right + 10;
		bone_y = _border.y + _border.down + 10;
	}
	if (rand_side == 3) {
		bone_x = _border.x - _border.left - 10;
		bone_y = _border.y - _border.up - 10;
	}
	var bone_direction = point_direction(bone_x, bone_y, _soul.x, _soul.y);
	create_bone(bone_x, bone_y, bone_sharp_obj, bone_speed, bone_size, bone_direction, bone_direction - 90);
	audio_play_sound_plugging(snd_projectile);
}

if(_time >= final_time + 60)
	instance_destroy();