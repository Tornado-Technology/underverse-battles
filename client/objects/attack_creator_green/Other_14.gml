/// @description Methods

// Кости и шипы со всех сторон
if (_id == 0 && attack_num == 0) {
	update_0_0 = function(pow) {
		var coord = rand_side_from(_border.x - _border.left - 20, _border.y - _border.up - 20, _border.x + _border.right + 20, _border.y + _border.down + 20);
		var spike_direction = point_direction(coord[0], coord[1], _soul.x, _soul.y);
		var spike = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, spike_obj);
		spike.speed_const = 2 + pow * 0.2;
		spike.direction = spike_direction;
		spike.image_angle = spike_direction;
		audio_play_sound_plugging(snd_projectile);
	}
	
	update_0_0_2 = function(pow) {
		var coord = rand_side_from(_border.x - _border.left - 20, _border.y - _border.up - 20, _border.x + _border.right + 20, _border.y + _border.down + 20);
		var bone_direction = point_direction(coord[0], coord[1], _soul.x, _soul.y);
		create_bone(coord[0], coord[1], bone_obj, 2 + pow * 0.2, 1, bone_direction, bone_direction - 90);
		audio_play_sound_plugging(snd_projectile);
	}
}

// Парные шипы
if (_id == 0 && attack_num == 1) {
	update_0_1 = function(pow) {
		var side = irandom_range(0, 1);
		var x_rand;
		var spear_direction = 0;
		if (side == 0) {
			x_rand = _border.x - _border.left - 10;
			spear_direction = 0;
		}
		else {
			x_rand = _border.x + _border.right + 10;
			spear_direction = 180;
		}
		var y_rand = irandom_range(_border.y - _border.up, _border.y + _border.down - 10);
		var spike = instance_create_depth(x_rand, y_rand, fight_depth.bullet_outside_hight, spike_obj);
		spike.speed_const = 2 + pow * 0.2;
		spike.direction = spear_direction;
		spike.image_angle = spear_direction;
		var spike = instance_create_depth(x_rand, y_rand + 10, fight_depth.bullet_outside_hight, spike_obj);
		spike.speed_const = 2 + pow * 0.2;
		spike.direction = spear_direction;
		spike.image_angle = spear_direction;
		audio_play_sound_plugging(snd_projectile);
	}
}

// Двигающаяся арена
if (_id == 0 && attack_num == 2) {
	update_0_2 = function(pow) {
		_border.speed_const = 1 + pow * 0.1;
		_border.direction = irandom_range(0, 359);
		var i = 0;
		repeat (sum_num) {
			_bones[i].speed_const = _border.speed_const;
			_bones[i].direction = _border.direction;
			i++;
		}
	}
	
	update_0_2_2 = function(pow) {
		var shift_max = 25 + (pow * 2);
		var change_direction = false
		if (_border.x < x_start - shift_max || _border.x > x_start + shift_max) {
			_border.direction = 180 - _border.direction;
			change_direction = true;
		}
			
		if (_border.y < y_start - shift_max || _border.y > y_start + shift_max) {
			_border.direction = - _border.direction;
			change_direction = true;
		}
			
		if (change_direction) {
			var i = 0;
			repeat (sum_num) {
				_bones[i].direction = _border.direction;
				i++;
			}
		}
	}
}

// Тыкающие кости справа и слева
if (_id == 0 && attack_num == 3) {
	update_0_3 = function(pow) {
		var rand_side = irandom_range(0, 1);
		var bone_x = _border.x - _border.left - 40;
		var bone_direction = 270;
		if (rand_side == 1) {
			bone_x = _border.x + _border.right + 40;
			bone_direction = 90;
		}
		var bone_y = irandom_range(_border.y - _border.up + 5, _border.y + _border.down - 5);
		var bone_speed = 2 + pow * 0.1;
		_bones[num] = create_bone(bone_x, bone_y, bone_obj, bone_speed, 2, bone_direction + 90, bone_direction);
		_bones[num]._delay = 0;
		_bones[num]._stage = 0;
		num++;
		audio_play_sound_plugging(snd_projectile);
	}
}

// Нити
if (_id == 1) {
	update_1_0 = function(pow) {
		var coord = rand_side_from(_border.x - _border.left - 20, _border.y - _border.up - 20, _border.x + _border.right + 20, _border.y + _border.down + 20);
		var spear_direction = point_direction(coord[0], coord[1], _soul.x, _soul.y);
		var spike = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, obj_spear_green);
		spike.speed_const = 2 + pow * 0.2;
		spike.direction = spear_direction;
		spike.image_angle = spear_direction;
	}
	
	update_1_0_2 = function(pow) {
		var coord = [];
		coord = rand_side_from(-1, -1, room_width + 1, room_height + 1);
	
		var thread = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, obj_string_green);
		thread.x_dir = _soul.x;
		thread.y_dir = _soul.y;
		thread.scale_speed = 3.2 + pow * 0.2;
	
		audio_play_sound_plugging(snd_string);
	}
}

// Турбо бластер следует за душой
if (_id == 2 && attack_num == 0) {
	update_2_0 = function() {
		var coord_new = rand_side_from(_border.x - _border.left, _border.y - _border.up, _border.x + _border.right, _border.y + _border.down);
		inst_turboblaster.x_dir = coord_new[0];
		inst_turboblaster.y_dir = coord_new[1];
		inst_turboblaster.target = _soul;
	}
}

// Турбо бластер сверху
if (_id == 2 && attack_num == 1) {
	update_2_1 = function() {
		var rand_pos = irandom_range(0, 2);
		var gb_x = _border.x - 12;
		if (rand_pos == 1) gb_x = _border.x;
		if (rand_pos == 2) gb_x = _border.x + 12;
		inst_turboblaster.x_dir = gb_x;
	}
}