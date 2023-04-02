/// @description Methods

// Самонаводящиеся ножи
if (_id == 0 && attack_num == 0) {
	update_0_0 = function() {
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
	
		var _inst = instance_create_depth(rX, rY, 0, obj_knife_spin_xchara);
		_inst._target_angle = point_direction(_inst.x, _inst.y, _soul.x, _soul.y);
	}
}

// Самонаводящиеся взрыв ножей
if (_id == 0 && attack_num == 1) {
	update_0_1 = function() {
		var coord = rand_side_from(_border.x - _border.left - 60, _border.y - _border.up - 40, _border.x + _border.right + 60, _border.y + _border.down + 40);
		instance_create_depth(coord[0], coord[1], 0, obj_knife_blast_xchara);
	}
}

// Ножи справа и слева
if (_id == 0 && attack_num == 2) {
	update_0_2 = function() {
		var va_x1_ = obj_camera.camera_position.x;
		var va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
		var side = irandom_range(0, 1);
		var rY = irandom_range(_border.y - _border.up, _border.y + _border.down);
		var rX = va_x1_ + 30;
		if (side == 1)
			var rX = va_x2_ - 30;
				
		var _inst = instance_create_depth(rX, rY, 0, obj_knife_directed_xchara);
		_inst.image_alpha = 0;
		if (side == 1)
			_inst._target_angle = 180;
	}
}

// Ножи по кругу
if (_id == 0 && attack_num == 3) {
	update_0_3 = function() {
		var dist_ = 120;
		var rX = _border.x - dist_ * cos(_side*pi/180);
		var rY = _border.y - dist_ * sin(_side*pi/180);
		_knife = instance_create_depth(rX, rY, 0, obj_knife_directed_xchara);
		_image_alpha = 0;
		__target_angle = point_direction(_x, _y, _border.x, _border.y);
		if (rot == 0)
			_side += step;
		else
			_side -= step;
	}
}

// Волна урона в сторону души
if (_id == 1 && attack_num == 0) {
	update_1_0 = function() {
		var va_x1_ = obj_camera.camera_position.x;
		var va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
		var va_y1_ = obj_camera.camera_position.y;
		var va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;
		var wave_speed = 3.2 + _power * 0.2;
		repeat(2) {
			var coord = [];
			coord = rand_side_from(va_x1_ - 40, va_y1_ - 40, va_x2_ + 40, va_y2_ + 40);
			_wave = instance_create_depth(coord[0], coord[1], 0, obj_damage_wave_xchara);
			
			var _shift_x = irandom_range(-8 - _power, 8 + _power);
			var _shift_y = irandom_range(-8 - _power, 8 + _power);
			
			_wave._target_angle = point_direction(_wave.x, _wave.y, _soul.x + _shift_x, _soul.y + _shift_y);
			_wave.speed_const = wave_speed;
		}
	}
}

// Волна урона в сторону центра
if (_id == 1 && attack_num == 1) {
	update_1_1 = function() {
		var va_x1_ = obj_camera.camera_position.x;
		var va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
		var va_y1_ = obj_camera.camera_position.y;
		var va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;
		var wave_speed = 3.2 + _power * 0.2;
		repeat(3) {
			var coord = [];
			coord = rand_side_from(va_x1_ - 40, va_y1_ - 40, va_x2_ + 40, va_y2_ + 40);
			_wave = instance_create_depth(coord[0], coord[1], 0, obj_damage_wave_xchara);
			var _shift_x = irandom_range(-8 - _power, 8 + _power);
			var _shift_y = irandom_range(-8 - _power, 8 + _power);
			_wave._target_angle = point_direction(_wave.x, _wave.y, _border.x + _shift_x, _border.y + _shift_y);
			_wave.speed_const = wave_speed;
		}
	}
}

// Волна урона с предупреждением
if (_id == 1 && attack_num == 2) {
	update_1_2 = function() {
		var i = 0;
		var num = 4 + round(_power / 2);
		var va_x1_ = obj_camera.camera_position.x;
		var va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
		var va_y1_ = obj_camera.camera_position.y;
		var va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;
		repeat(num) {
			coord_wave[i] = rand_side_from(va_x1_ - 40, va_y1_ - 40, va_x2_ + 40, va_y2_ + 40);
			zone_[i] = instance_create_depth(coord_wave[i, 0], coord_wave[i, 1], fight_depth.bullet_outside_hight, obj_zone_damage_wave);
			zone_[i].x_side = _soul.x;
			zone_[i].y_side = _soul.y;
			zone_[i].show_zone = true;
			i++;
		}
		audio_play_sound_plugging(snd_warning);
	}
	
	update_1_2_2 = function() {
		var i = 0;
		var num = 4 + round(_power / 2);
		var wave_speed = (3.2 + _power * 0.2) * 1.4;
		repeat(num) {
			_wave = instance_create_depth(coord_wave[i, 0], coord_wave[i, 1], 0, obj_damage_wave_xchara);
			_wave._target_angle = point_direction(_wave.x, _wave.y, zone_[i].x_side, zone_[i].y_side);
			_wave.speed_const = wave_speed;
			instance_destroy(zone_[i]);
			i++;
		}
	}
}

// Зоны урона на квадратной арене
if (_id == 2 && attack_num == 0) {
	update_2_0 = function() {
		var random_position = Vector2(irandom_range(_border.x - _border.left + 12, _border.x + _border.right - 12), irandom_range(_border.y - _border.up + 12, _border.y + _border.down - 12));
		instance_create_depth(random_position.x, random_position.y, fight_depth.bullet_outside, obj_damage_zone_warning_xchara);
	}
}

// Зоны урона на небольшой арене
if (_id == 2 && attack_num == 1) {
	update_2_1 = function() {
		var random_position = Vector2(irandom_range(_border.x - _border.left + 12, _border.x + _border.right - 12), _border.y);
		instance_create_depth(random_position.x, random_position.y, fight_depth.bullet_outside, obj_damage_zone_warning_xchara);
	}
}