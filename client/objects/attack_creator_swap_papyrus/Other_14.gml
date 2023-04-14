/// @description Methods

// Кости на всю высоту
if (_id == 0 && attack_num == 0) {
	update_0_0 = function (pow) {
		var rand_side = choose(dir.up, dir.down, dir.left, dir.right);
		var bone_speed = 2 + pow * 0.2;
		var bone_size = 8.3;
		if (rand_side == dir.left) {
			var _inst = create_bone(_border.x - _border.left - 4, _border.y + _border.down, bone_obj,
			bone_speed, bone_size, 0, 0);
		}
		else if (rand_side == dir.right) {
			var _inst = create_bone(_border.x + _border.right + 4, _border.y + _border.down, bone_obj,
			bone_speed, bone_size, 180, 0);
		}
		else if (rand_side == dir.down) {
			var _inst = create_bone(_border.x + _border.right, _border.y + _border.down + 4, bone_obj,
			bone_speed, bone_size, 90, 90);
		}
		else if (rand_side == dir.up) {
			var _inst = create_bone(_border.x + _border.right, _border.y - _border.up - 4, bone_obj,
			bone_speed, bone_size, 270, 90);
		}
	}
}

// Кости и оранжевые кости
if (_id == 0 && attack_num == 1) {
	update_0_1 = function (pow) {
		var _bone = bone_obj;
		var rand_side = irandom_range(0, 7);
		var rand_bone_type = irandom_range(0, 1);
		if (rand_bone_type == 0)
			_bone = bone_orange_obj;
		
		var rand_speed = 2 + random_range(0, pow * 0.2);
		var max_size = 8.3;
		var rand_size = rand_bone_type == 0 ? max_size : random_range(3 + pow * 0.2, 6);
		var x0, y0, bone_direction, bone_angle;
		if (rand_side == 0) {
			x0 = _border.x - _border.left - 4;
			y0 = _border.y + _border.down;
			bone_direction = 0;
			bone_angle = 0;
		}
		if (rand_side == 1) {
			x0 = _border.x + _border.right + 4;
			y0 = _border.y - _border.up;
			bone_direction = 180;
			bone_angle = 180;
		}
		if (rand_side == 2) {
			x0 = _border.x - _border.left - 4;
			y0 = _border.y - _border.up;
			bone_direction = 0;
			bone_angle = 180;
		}
		if (rand_side == 3) {
			x0 = _border.x + _border.right + 4;
			y0 = _border.y + _border.down;
			bone_direction = 180;
			bone_angle = 0;
		}
		if (rand_side == 4) {
			x0 = _border.x + _border.right;
			y0 = _border.y + _border.down + 4;
			bone_direction = 90;
			bone_angle = 90;
		}
		if (rand_side == 5) {
			x0 = _border.x - _border.left;
			y0 = _border.y - _border.up - 4;
			bone_direction = 270;
			bone_angle = 270;
		}
		if (rand_side == 6) {
			x0 = _border.x - _border.left;
			y0 = _border.y + _border.down + 4;
			bone_direction = 90;
			bone_angle = 270;
		}
		if (rand_side == 7) {
			x0 = _border.x + _border.right;
			y0 = _border.y - _border.up - 4;
			bone_direction = 270;
			bone_angle = 90;
		}
		create_bone(_border.x - _border.left - 4, _border.y + _border.down, _bone, rand_speed, rand_size, 0, 0);
	}
}

// Вылезающие кости из стенок
if (_id == 0 && attack_num == 2) {
	update_0_2 = function () {
		while (true) {
			random_number = irandom_range(0, sum_num - 1);
			if (_bones[random_number] != noone) break;
		}
		bone_moving = _bones[random_number];
		bone_moving.shake();
		_bones[random_number] = create_bone(bone_moving.x, bone_moving.y, bone_obj, 0, 1, 0, 270);
		bone_new = _bones[random_number];
	}
	update_0_2_2 = function (bone_old, bone_new) {
		bone_old.speed_const = 4;
		bone_new.change_scale(2, 0.1);
		audio_play_sound_plugging(snd_spare_up);
	}
}

// Две кости
if (_id == 0 && attack_num == 3) {
	update_0_3 = function(pow) {
		var _side = choose(dir.left, dir.up);
		var bone_speed = 1.5 + 0.2 * pow;
		var bone_size = _id == 0 ? 5.4 : 4.2;
		if (_side == dir.left) {
			create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 0, 180);
			create_bone(_border.x + _border.right + 20, _border.y + _border.right + 20, bone_obj, bone_speed, bone_size, 180, 0);
		}
		if (_side == dir.up) {
			create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 270, 270);
			create_bone(_border.x + _border.right + 20, _border.y + _border.down + 20, bone_obj, bone_speed, bone_size, 90, 90);
		}
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

// Кости в виде платформ и гастербластеры
if (_id == 1 && attack_num == 2) {
	update_1_2 = function() {
		var position_number = irandom_range(0, 2);
		var border_distance = 180;
		switch (position_number) {
			case 0:
				create_gasterblaster(gb_obj, _border.x + border_distance, _border.y + 28, _border.x, _border.y + 30,  270);
				break;
			case 1:
				create_gasterblaster(gb_obj, _border.x + border_distance, _border.y, _border.x, _border.y,  270);
				break;
			case 2:
				create_gasterblaster(gb_obj, _border.x + border_distance, _border.y - 28, _border.x, _border.y - 30,  270);
				break;
		}
	}
	update_1_2_2 = function(pow) {
		var bone_speed = 1 + pow * 0.1;
		var bone = create_bone(_border.x - _border.left - 4, _border.y - 15, bone_obj,
			bone_speed, 2, 0, 90);
		var bone = create_bone(_border.x + _border.right + 4, _border.y + 15, bone_obj,
			bone_speed, 2, 180, 270);
	}
}

// Оранжевая атака
if (_id == 2 && attack_num == 0) {
	update_2_0 = function() {
		var i = 0;
		repeat(array_length(_bones)) {
			instance_destroy(_bones[i]);
			_bones[i] = noone;
			i++;
		}
		
		side = irandom_range(0, 3);
		var i = 0;
		repeat(num) {
			if (i == 0)
				character_instance.prev_sprite = noone;
			if (side == 0) {
				_bones[i] = instance_create_depth(_border.x - _border.left + i * 10, _border.y - _border.up - 20, fight_depth.bullet_outside, bone_obj);
				_bones[i].image_angle = 180;
				if (i == 0) {
					_soul.side = 1;
					prev_side = 0;
				}
			}
			if (side == 1) {
				_bones[i] = instance_create_depth(_border.x - _border.left + i * 10, _border.y + _border.down + 20, fight_depth.bullet_outside, bone_obj);
				_bones[i].image_angle = 0;
				if (i == 0) {
					_soul.side = 2;
					prev_side = 1;
				}
			}
			if (side == 2) {
				_bones[i] = instance_create_depth(_border.x - _border.left - 20, _border.y - _border.up + i * 10, fight_depth.bullet_outside, bone_obj);
				_bones[i].image_angle = 270;
				if (i == 0) {
					_soul.side = 3;
					prev_side = 2;
				}
			}
			if (side == 3) {
				_bones[i] = instance_create_depth(_border.x + _border.right + 20, _border.y - _border.up + i * 10, fight_depth.bullet_outside, bone_obj);
				_bones[i].image_angle = 90;
				if (i == 0) {
					_soul.side = 4;
					prev_side = 3;
				}
			}
			++i;
		}
		//character_instance.change_sprite_hand_dir(side);
		var i = 0;
		repeat(num) {
			_bones[i].change_scale(bone_scale, 0.3);
			i++;
		}
		audio_play_sound_plugging(snd_spare_up);
	}
	update_2_0_2 = function() {
		var i = 0;
		repeat(num) {
			_bones[i].change_scale(0, 0.3);
			i++;
		}
	}
}

if (_id == 2 && attack_num == 1) {
	update_2_1 = function() {
		side = choose(dir.up, dir.down, dir.left, dir.right);
			new_warning = true;
			if (attack_num == 0) {
				_soul.gravity_force = side;
				_soul.max_fly_time = 60;
				_soul.fly_time = _soul.max_fly_time;
				_soul.blue_attack = true;
				_soul.addit_spd = 5;
			}
			var i = 0;

			repeat(num) {
				if (side == dir.up) {
					_bones[i] = create_bone(_border.x - _border.left + i * 10, _border.y - _border.up - 25, bone_obj, 0, 1, 0, 180);
				}
				if (side == dir.down) {
					_bones[i] = create_bone(_border.x - _border.left + i * 10, _border.y + _border.down + 25, bone_obj, 0, 1, 0, 0);
				}
				if (side == dir.left) {
					_bones[i] = create_bone(_border.x - _border.left - 25, _border.y - _border.up + i * 10, bone_obj, 0, 1, 0, 270);
				}
				if (side == dir.right) {
					_bones[i] = create_bone(_border.x + _border.right + 25, _border.y - _border.up + i * 10, bone_obj, 0, 1, 0, 90);
				}
				++i;
			}
			character_instance.change_sprite_hand_dir(side);
	}

	update_2_1_2 = function() {
		var i = 0;
		repeat(num) {
			_bones[i].change_scale(bone_scale, 0.2);
			++i;
		}
		audio_play_sound_plugging(snd_spare_up);
	}

	update_2_1_3 = function() {
		var i = 0;
		repeat(num) {
			_bones[i].change_scale(1, 0.2);
			++i;
		}
	}
}