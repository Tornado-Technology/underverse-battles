/// @description Methods

// Кости вылезают из стенок
if (_id == 0 && attack_num == 0) {
	update_0_0 = function(pow) {
		var coord = [];
		coord = rand_side_from(_border.x - _border.left - 40, _border.y - _border.up - 40, _border.x + _border.right + 40, _border.y + _border.down + 40);
		var bone_dir = point_direction(coord[0], coord[1], _border.x, _border.y);
		var bone_speed = 1.3 + 0.2 * pow;
		create_bone(coord[0], coord[1], bone_topref_obj, bone_speed, random_range(2, 6), bone_dir, bone_dir - 90);
		++num;
	}
}

// Кости вылетают справа и слева
if (_id == 0 && attack_num == 1 || _id == 1 && attack_num == 0) {
	update_0_1 = function(pow) {
		var rand_side = irandom_range(0, 1);
		var rand_y = random_range(-_border.up + 3, _border.down - 3);
		var rand_x = -_border.left - 15;
		var rand_dir = 0;
		var rand_ang = 90;
		if (rand_side == 1) {
			rand_x = _border.right + 15;
			rand_dir = 180;
			rand_ang = 270;
		}
		create_bone(_border.x + rand_x, _border.y + rand_y, bone_topref_obj, 2 + 0.2 * pow, 1, rand_dir, rand_ang);
	}
}

// Обстрел костями сверху
if (_id == 0 && attack_num == 2) {
	update_0_2 = function(pow) {
		var rand_x = choose(_border.x - _border.left - 10, _border.x + _border.right + 10);
		var bone_dir = point_direction(rand_x, _border.y - _border.up - 10, _soul.x, _soul.y);
		var bone_speed = 2 + 0.2 * pow;
		create_bone(rand_x, _border.y - _border.up - 5, bone_topref_obj, bone_speed, 1, bone_dir, bone_dir - 90);
		audio_play_sound_plugging(snd_projectile);
	}
}

// Платформы и кости
if (_id == 0 && attack_num == 3) {
	update_0_3 = function(pow) {
		var main_speed = 1 + pow * 0.1;
		var chance = irandom_range(0, 6);
		if (chance % 2 == 0) {
			create_bone(_border.x - _border.left, _border.y + _border.down, bone_obj, main_speed, 1.4, 0, 0);
		}
		if (chance > 2 && chance != 5) {
			create_bone(_border.x + _border.right, _border.y + 15, bone_obj, -main_speed, 1.4, 0, 0);
		}
		if (chance > 4 || chance == 1) {
			create_bone(_border.x - _border.left, _border.y - 15, bone_obj, main_speed, 1.4, 0, 0);
		}
	}
	
	update_0_3_2 = function(pow) {
		if (pow >= 3) {
			create_aiming_gasterblaster(aim_gb_obj, _soul);
			time_source_start(time_source_update_0_3_2);
		}
	}
	
	update_0_3_3 = function(pow) {
		var main_speed = 1 + pow * 0.1;
		create_next_moving_platform(_border.x - _border.left - 40, _border.y - 15, 4, 6, 60, main_speed);
		create_next_moving_platform(_border.x + _border.right + 40, _border.y + 15, 4, 6, 60, -main_speed);
	}
}

// Нож режет арену и кости вылетают справа и слева
if (_id == 1 && attack_num == 0) {
	update_1_0 = function(pow) {
		var py1 = _border.y - _border.up;
		var py2 = _border.y + _border.down;
		var rand_px1 = irandom_range(_border.x - _border.left, _border.x + _border.right);
		var rand_px2 = irandom_range(_border.x - _border.left, _border.x + _border.right);
		if (rand_px1 < _border.x - _border.left + 20 && rand_px2 < _border.x - _border.left + 20)
			rand_px2 += 20;
		if (rand_px1 < _border.x + _border.right - 20 && rand_px2 > _border.x + _border.right - 20)
			rand_px2 -= 20;
		var rand_dir = point_direction(rand_px1, py1, rand_px2, py2);
		var rand_dist = point_distance(rand_px1, py1, rand_px2, py2);
		audio_play_sound_plugging(snd_stab);
		instance_create_depth(rand_px1, py1, fight_depth.bullet_outside_hight, obj_knife_swing, {
			image_angle: rand_dir,
			image_xscale: rand_dist / 64
		});
	}
}

// Нож летает справа-слева
if (_id == 1 && attack_num == 1) {
	update_1_1 = function(pow) {
		knife.spin(choose(-1, 1) * (3 + pow * 0.2));
		knife.move(3 + pow * 0.2);
		audio_play_sound_once(snd_projectile);
	}
}

// Перепрыгивание через кости с большим ножом
if (_id == 1 && attack_num == 2) {
	update_1_2 = function(pow) {
		knife.move(3 + pow * 0.2);
		knife.move_up();
		audio_play_sound_once(snd_projectile);
	}
	
	update_1_2_2 = function(pow) {
		var offset = -5;
		var side = -_border.left + offset;
		var bone_dir = 0;
		if (rand_num == 0) {
			offset = 5;
			side = _border.right + offset;
			bone_dir = 180;
		}
		for (var i = 0; i < 5; ++i) {
			create_bone(_border.x + side + offset*i*2, _border.y + _border.down + 4, bone_obj, 2 + 0.1 * pow, 1 + sin(pi*i/4), bone_dir, 0);
		}
	}
}

// Наводящиеся гастербластеры
if (_id == 2 && attack_num == 0) {
	update_2_0 = function(pow) {
		create_aiming_gasterblaster(aim_gb_obj, _soul);
	}
	
	update_2_0_2 = function(pow) {
		repeat (2) { create_aiming_gasterblaster(aim_gb_obj, _soul); }
	}
}

// Синяя душа и гастербластеры
if (_id == 2 && attack_num == 1) {
	update_2_1 = function(pow) {
		repeat (2) { create_aiming_gasterblaster(aim_gb_obj, _soul); }
	}
}

// Платформы и гастербластеры
if (_id == 2 && attack_num == 2) {
	update_2_2 = function(pow) {
		var _gb_pos = irandom_range(0, 2);
		var border_dist = 180;
		var sector_y_step = 35;
		var sector_y = _border.y - _border.up + 25;
		switch (_gb_pos) {
			case 0:
				create_gasterblaster(gb_obj, _border.x + border_dist, sector_y - 5, _border.x, sector_y - 5,  270);
				break;
			case 1:
				create_gasterblaster(gb_obj, _border.x + border_dist, sector_y + sector_y_step - 5, _border.x, sector_y + sector_y_step - 5,  270);
				break;
			case 2:
				create_gasterblaster(gb_obj, _border.x + border_dist, sector_y + sector_y_step * 2 - 5, _border.x, sector_y + sector_y_step * 2 - 5,  270);
				break;
		}
	}
	
	update_2_2_2 = function(pow) {
		var main_speed = 0.5 + pow * 0.1;
		var sector_y_step = 35;
		var sector_y = _border.y - _border.up + 25;
		create_next_moving_platform(_border.x - _border.left - 40, sector_y, 4, 6, 60, main_speed);
		create_next_moving_platform(_border.x + _border.right + 40, sector_y + sector_y_step, 4, 6, 60, -main_speed);
		create_next_moving_platform(_border.x - _border.left - 40,  sector_y + sector_y_step * 2, 4, 6, 60, main_speed);
	}
}

// Крестоносец
if (_id == 3) {
	update_3_0 = function() {
		var bone_angle_speed = choose(1, -1);
		_bones[0].angle_speed = bone_angle_speed;
		_bones[1].angle_speed = bone_angle_speed;
	}
	
	update_3_1 = function() {
		create_aiming_gasterblaster(aim_gb_obj, _soul);
	}
	
	update_3_2 = function() {
		var rand_side = rand_side_from(_border.x - _border.left - 15, _border.y - _border.up - 15, _border.x + _border.right + 15, _border.y + _border.down + 15);
		var _knife = instance_create_depth(rand_side[0], rand_side[1], fight_depth.bullet_outside, knife_directed_obj);
		_knife.image_alpha = 0;
		_knife._target_angle = point_direction(rand_side[0], rand_side[1], _soul.x, _soul.y);
		audio_play_sound_plugging(snd_projectile);
	}
	
	update_3_3 = function() {
		_bones[0].change_scale(0, 0.1);
		_bones[1].change_scale(0, 0.1);
	}
	
	update_3_4 = function() {
		_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.blue);
		instance_destroy(_bones[0]);
		instance_destroy(_bones[1]);
	}
	
	update_3_5 = function() {
		repeat (2) create_aiming_gasterblaster(aim_gb_obj, _soul);
	}
}