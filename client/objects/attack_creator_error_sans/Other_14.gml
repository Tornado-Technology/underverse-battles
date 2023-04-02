/// @description Methods

if (_id == 0 || attack_num == 0) {
	update_0_0 = function () {
		var rand_place = irandom_range(0, 2);
		if (rand_place == 0)
			_bones[num] = instance_create_depth(_soul.x, obj_battle_border.y - obj_battle_border.up - 20, fight_depth.bullet_outside, bone_obj);
		else {
			var rand_x = irandom_range(obj_battle_border.x - obj_battle_border.left, obj_battle_border.x + obj_battle_border.right);
			_bones[num] = instance_create_depth(rand_x, obj_battle_border.y - obj_battle_border.up - 20, fight_depth.bullet_outside, bone_obj);
		}
		_bones[num].image_angle = 180;
		_bones[num]._delay = 0;
		_bones[num]._hspd = 0;
		_bones[num]._falling_sound = true;
		++num;
	}
}

if (_id == 0 || attack_num == 1) {
	update_0_1 = function () {
		var coord = [];
		coord = rand_side_from(_border.x - _border.left - 40, _border.y - _border.up - 40, _border.x + _border.right + 40, _border.y + _border.down + 40);
		_bones[num] = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside, bone_obj);
		_bones[num].direction = point_direction(_bones[num].x, _bones[num].y, _border.x, _border.y);
		_bones[num].image_angle = _bones[num].direction - 90;
		_bones[num].image_yscale = 3.2;
		_bones[num].speed_const = 1.5 + 0.1 * _power;
		_bones[num]._delay = 0;
		_bones[num]._stage = 0;
		++num;
		audio_play_sound_plugging(snd_projectile);
	}
}