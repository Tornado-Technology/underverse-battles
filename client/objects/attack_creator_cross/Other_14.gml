/// @description Methods
event_inherited();

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
if (_id == 0 && attack_num == 1) {
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
			create_aiming_gasterblaster(obj_gasterblaster_aiming_sans, _soul);
			time_source_start(time_source_attack_0_3_2);
		}
	}
	
	update_0_3_3 = function(pow) {
		var main_speed = 1 + pow * 0.1;
		create_next_moving_platform(_border.x - _border.left - 40, _border.y - 15, 4, 6, 60, main_speed);
		create_next_moving_platform(_border.x + _border.right + 40, _border.y + 15, 4, 6, 60, -main_speed);
		time_source_start(time_source_attack_0_3_3);
	}
}

// Синяя душа и гастербластеры
if (_id == 1 && attack_num == 1) {
	update_1_1 = function(pow) {
		repeat (2) { create_aiming_gasterblaster(aim_gb_obj, _soul); }
	}
}

// Крестоносец
if (_id == 3) {
	update_3_0 = function() {
		create_aiming_gasterblaster(aim_gb_obj, _soul);
	}
	
	update_3_1 = function(pow) {
		create_aiming_gasterblaster(aim_gb_obj, _soul);
	}
}