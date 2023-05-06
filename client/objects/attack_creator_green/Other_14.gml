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
		var spike_direction = 0;
		if (side == 0) {
			x_rand = _border.x - _border.left - 10;
			spike_direction = 0;
		}
		else {
			x_rand = _border.x + _border.right + 10;
			spike_direction = 180;
		}
		var y_rand = irandom_range(_border.y - _border.up, _border.y + _border.down - 10);
		var spike = instance_create_depth(x_rand, y_rand, fight_depth.bullet_outside_hight, spike_obj);
		spike.speed_const = 2 + pow * 0.2;
		spike.direction = spike_direction;
		spike.image_angle = spike_direction;
		var spike = instance_create_depth(x_rand, y_rand + 10, fight_depth.bullet_outside_hight, spike_obj);
		spike.speed_const = 2 + pow * 0.2;
		spike.direction = spike_direction;
		spike.image_angle = spike_direction;
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
if (_id == 2 && attack_num == 0 || _id == 3) {
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

// Редактирование
if (_id == 3) {
	update_3_0 = function() {
		if (!instance_exists(edit_button)) return;
		switch (edit_button.edit_attack_number) {
			case 0:
				var coord = rand_side_from(_border.x - _border.left - 20, _border.y - _border.up - 20, _border.x + _border.right + 20, _border.y + _border.down + 20);
				var spike_direction = point_direction(coord[0], coord[1], _soul.x, _soul.y);
				var spike = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, spike_obj);
				spike.speed_const = 2.6;
				spike.direction = spike_direction;
				spike.image_angle = spike_direction;
				array_push(editing_object, spike);
				audio_play_sound_plugging(snd_projectile);
				break;
			case 1:
				var side = irandom_range(0, 1);
				var x_rand;
				var bone_direction = 0;
				if (side == 0) {
					x_rand = _border.x - _border.left - 10;
					spike_direction = 0;
				}
				else {
					x_rand = _border.x + _border.right + 10;
					spike_direction = 180;
				}
				var y_rand = irandom_range(_border.y - _border.up, _border.y + _border.down - 10);
				var spike = instance_create_depth(x_rand, y_rand, fight_depth.bullet_outside_hight, spike_obj);
				spike.speed_const = 2.6;
				spike.direction = spike_direction;
				spike.image_angle = spike_direction;
				array_push(editing_object, spike);
				audio_play_sound_plugging(snd_projectile);
				break;
			case 2:
				var coord = rand_side_from(_border.x - _border.left - 20, _border.y - _border.up - 20, _border.x + _border.right + 20, _border.y + _border.down + 20);
				var bone_direction = point_direction(coord[0], coord[1], _soul.x, _soul.y);
				var bone = create_bone(coord[0], coord[1], bone_obj, 2.6, 1, bone_direction, bone_direction - 90);
				array_push(editing_object, bone);
				audio_play_sound_plugging(snd_projectile);
				break;
			case 3:
				var side = irandom_range(0, 1);
				var x_rand;
				var bone_direction = 0;
				if (side == 0) {
					x_rand = _border.x - _border.left - 10;
					bone_direction = 0;
				}
				else {
					x_rand = _border.x + _border.right + 10;
					bone_direction = 180;
				}
				var y_rand = irandom_range(_border.y - _border.up, _border.y + _border.down - 10);
				var bone = create_bone(x_rand, y_rand, bone_obj, 2.6, 1, bone_direction, bone_direction - 90);
				array_push(editing_object, bone);
				audio_play_sound_plugging(snd_projectile);
				break;
			case 4:
				var va_x1_ = obj_camera.camera_position.x;
				var va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
				var va_y1_ = obj_camera.camera_position.y;
				var va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;
				var rX = irandom_range(va_x1_ + 64, va_x2_ - 64);
				var rY = irandom_range(va_y1_ + 24, va_y2_ - 24);
				while(point_in_rectangle(rX, rY, _border.x - _border.left, _border.y - _border.up, _border.x + _border.right, _border.y + _border.down)) {
					var rX = irandom_range(va_x1_ + 64, va_x2_ - 64);
					var rY = irandom_range(va_y1_ + 24, va_y2_ - 24);
				}
	
				var _inst = instance_create_depth(rX, rY, 0, knife_spin_obj);
				_inst._target_angle = point_direction(_inst.x, _inst.y, _soul.x, _soul.y);
				array_push(editing_object, _inst);
				break;
			case 5:
				var dist_ = 120;
				var step_angle = 0;
				repeat (2) {
					var alpha = (_side + step_angle);
					var rX = _border.x - dist_ * dcos(alpha);
					var rY = _border.y - dist_ * dsin(alpha);
					
					var _knife = instance_create_depth(rX, rY, 0, knife_directed_obj);
					_knife.image_alpha = 0;
					_knife._target_angle = point_direction(rX, rY, _border.x, _border.y);
					array_push(editing_object, _knife);
					
					step_angle += 90;
				}
				if (rot == 0)
					_side += step;
				else
					_side -= step;
				break;
			case 6:
				if (inst_turboblaster == noone) {
					var period = 35;
					var gb_size = 60;
					var con = room_height + gb_size;
					var coord = rand_side_from(-gb_size, -gb_size, con, con);
					inst_turboblaster = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, gb_aim_obj, {
						target_time: (period - 10) / 60,
						charge_time: period / 60,
						destroy_time: 15 / 60
					});
					array_push(editing_object, inst_turboblaster);
				}
				update_2_0();
				break;
		}
	}
}