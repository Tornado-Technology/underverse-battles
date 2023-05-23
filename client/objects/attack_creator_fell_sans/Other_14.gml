/// @description Methods

// Волна из костей
if (_id == 0 && attack_num == 0) {
	update_0_0 = function(pow) {
		var bone_speed = 3 + pow;
		var bone_size = pow < 4 ? 4.4 + _shift : 4.5 + _shift;
		create_bone(_border.x - _border.left, _border.y + _border.down + 20, bone_obj, bone_speed, bone_size, 0, 0);
		create_bone(_border.x - _border.left, _border.y - _border.up - 20, bone_obj, bone_speed, 9-bone_size, 0, 180);
		_shift = sin(wave_time);
		wave_time += 0.8;
	}
}

// Летящие кости справа и слева
if (_id == 0 && attack_num == 1 || _id == 3) {
	update_0_1 = function(pow) {
		var side = irandom_range(0, 1);
		var _inst;
			
		if (side == 0) {
			_inst = instance_create_depth(_border.x - _border.left - 10, _soul.y, fight_depth.bullet_outside, spin_bone_obj);
			_inst.speed_const = 3 + pow * 0.1;
			_inst.direction_const = 0;
		} else {
			_inst = instance_create_depth(_border.x + _border.right + 10, _soul.y, fight_depth.bullet_outside, spin_bone_obj);
			_inst.speed_const = 3 + pow * 0.1;
			_inst.direction_const = 180;
		}
		audio_play_sound_plugging(snd_projectile);
	}
}

// Две кости
if (_id == 0 && attack_num == 2) {
	update_0_2 = function(pow) {
		var bone_speed = 1.5 + 0.5*pow;
		var bone_size = 5.5;
		if (_side == 0) {
			create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 0, 180);
			create_bone(_border.x + _border.right + 20, _border.y + _border.right + 20, bone_obj, bone_speed, bone_size, 180, 0);
		}
		if (_side == 1) {
			create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 270, 270);
			create_bone(_border.x + _border.right + 20, _border.y + _border.down + 20, bone_obj, bone_speed, bone_size, 90, 90);
		}
	}
}

// Летящие кости сверху
if (_id == 0 && attack_num == 3) {
	update_0_3 = function(pow) {
		var rand_x = irandom_range(-_border.left, _border.right);
		var _inst = instance_create_depth(_border.x + rand_x, _border.y - _border.up - 10, fight_depth.bullet_outside, spin_bone_obj);
		_inst.speed_const = 3 + pow * 0.1;
		_inst.direction_const = point_direction(_inst.x, _inst.y, _soul.x, _soul.y);
		audio_play_sound_plugging(snd_projectile);
	}
}

// Наводящиеся гастербластеры
if (_id == 1 && attack_num == 0) {
	update_1_0 = function(pow) {
		create_aiming_gasterblaster(aim_gb_obj, _soul);
	}
	update_1_0_2 = function(pow) {
		repeat (2) { create_aiming_gasterblaster(aim_gb_obj, _soul); }
	}
}

// Крестовые гастербластеры
if (_id == 1 && attack_num == 1) {
	update_1_1 = function(pow) {
		var x_gb, y_gb;
		var gb_size = 60;
		var pos = irandom_range(0, 3);
		var con = room_height + gb_size;
		var rnd = irandom_range(-gb_size, con);
			
		repeat(2) {
			switch (pos) {
				case 0:
					x_gb = -gb_size;
					y_gb = rnd;
					break;
		
				case 1:
					x_gb = rnd;
					y_gb = con;
					break;
		
				case 2:
					x_gb = con;
					y_gb = rnd;
					break;
		
				case 3:
					x_gb = rnd;
					y_gb = -gb_size;
					break;
			}
			create_gasterblaster(gb_obj, x_gb, y_gb, _border.x, _border.y, point_direction(x_gb, y_gb, _border.x, _border.y) + 90);
			pos = (pos + 1) % 4;
		}
	}
}

// Гастербластеры сверху
if (_id == 1 && attack_num == 2) {
	update_1_2 = function(pow) {
		repeat (pow == 5 ? 2 : 1) {
			var _gb_pos = irandom_range(0, 2);
			var border_dist = 100;
			switch (_gb_pos) {
				case 0:
					create_gasterblaster(gb_obj, _border.x + 20, _border.y - _border.up - border_dist, _border.x + 20, _border.y, 0);
					break;
				case 1:
					create_gasterblaster(gb_obj, _border.x, _border.y - _border.up - border_dist, _border.x, _border.y, 0);
					break;
				case 2:
					create_gasterblaster(gb_obj, _border.x - 20, _border.y - _border.up - border_dist, _border.x - 20, _border.y, 0);
					break;
			}
		}
	}
	
	update_1_2_2 = function(pow) {
		if (pow >= 2) {
			var randim_side = choose(dir.left, dir.right);
			if (randim_side == dir.left)
				create_bone(_border.x - _border.left - 10, _border.y + _border.down + 10, bone_obj, 1.2 + pow * 0.1, 1.4, 0, 0);
			else
				create_bone(_border.x + _border.right + 10, _border.y + _border.down + 10, bone_obj, 1.2 + pow * 0.1, 1.4, 180, 0);
		}
	}
}

// Синяя атака
if (_id == 2 || _id == 3) {
	update_2_0 = function(pow) {
		var side = choose(dir.up, dir.down, dir.left, dir.right);
		new_warning = true;
		if (attack_num == 0) {
			_soul.change_gravity_force(side);
		}
		
		var i = 0;
		repeat(array_length(_bones)) {
			instance_destroy(_bones[i]);
			_bones[i] = noone;
			++i;
		}
		
		_bones[0] = instance_create_depth(_border.x + _border.right + 10, _border.y - _border.up - 15, fight_depth.bullet_outside, bone_obj);
		_bones[0].image_angle = 180;
		_bones[0].direction = 180;
		_bones[1] = instance_create_depth(_border.x - _border.left - 10, _border.y + _border.down + 15, fight_depth.bullet_outside, bone_obj);
		_bones[1].image_angle = 0;
		_bones[1].direction = 0;
		_bones[2] = instance_create_depth(_border.x - _border.left - 15, _border.y - _border.up - 10, fight_depth.bullet_outside, bone_obj);
		_bones[2].image_angle = 270;
		_bones[2].direction = 270;
		_bones[3] = instance_create_depth(_border.x + _border.right + 15, _border.y + _border.down + 10, fight_depth.bullet_outside, bone_obj);
		_bones[3].image_angle = 90;
		_bones[3].direction = 90;
		
		if (attack_num == 0) {
			var bone_scale = 1.9;
			var i = 0;
			repeat(array_length(_bones)) {
				_bones[i].image_yscale = bone_scale;
				_bones[i].speed_const = 1.7 + pow * 0.1;
				++i;
			}
		}
		else
		{
			var bone_scale = 4.6;
			var rand_side = irandom_range(0, 3);
			_bones[rand_side].image_yscale = bone_scale;
			_bones[rand_side].speed_const = 1.8 + pow * 0.1;
		}
	
		character_instance.change_sprite_hand_dir(side);
	}
}

// Прекрасное время
if (_id == 3) {
	update_3_3 = function() {
		var radius = _border.up * 2;
		var x_gb = _border.x + radius * cos(degtorad(_angle));
		var y_gb = _border.y + radius * sin(degtorad(_angle));
		create_gasterblaster(gb_obj, x_gb, y_gb, _border.x, _border.y, point_direction(x_gb, y_gb, _border.x, _border.y) + 90);
		_angle += angle_step;
	}
	
	update_3_3_2 = function() {
		angle_step = 15;
	}
}