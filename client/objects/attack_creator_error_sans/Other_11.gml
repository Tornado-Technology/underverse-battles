/// @description Strings
_time++;

// Create border
var border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
if (battle_border_start_animation_end()) exit;

// Create soul
var soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);

// Attack

if (_time % 38 - _power * 3 == 0) {
	var coord = [];
	coord = rand_side_from(-1, -1, room_width + 1, room_height + 1);
	
	var thread = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, obj_thread_error_sans);
	thread.x_dir = soul.x;
	thread.y_dir = soul.y;
	thread.scale_speed = 3.4 + _power * 0.2;
	
	audio_play_sound_plugging(snd_string);
}

if (_time == 300 && soul.moveable) {
	instance_destroy();
	exit;
}

if (_time >= 300) {
	if (_time % 10 == 0 && _time < 310 + _power * 10) {
		var coord = [];
		coord = rand_side_from(border.x - border.left - 15, border.y - border.up - 15, border.x + border.right + 15, border.y + border.down + 15);
		var bone = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, bone_obj);
		bone.direction = point_direction(bone.x, bone.y, soul.x, soul.y);
		bone.image_angle = bone.direction - 90;
		bone.speed = 4;
		audio_play_sound_plugging(snd_projectile);
	}
}

if (_time >= 350 + _power * 10) instance_destroy();