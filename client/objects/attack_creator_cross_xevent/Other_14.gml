/// @description Methods
event_inherited();

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
		spin();
		move(3 + pow * 0.2);
		audio_play_sound_once(snd_projectile);
	}
}

// Перепрыгивание через кости с большим ножом
if (_id == 1 && attack_num == 2) {
	update_1_2 = function(pow) {
		move(3 + pow * 0.2);
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
		time_source_start(time_source_update_1_2_2);
	}
}

