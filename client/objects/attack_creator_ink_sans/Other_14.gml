/// @description Methods

// Капли падают сверху
if (_id == 0 && attack_num == 0) {
	update_0_0 = function () {
		var x0 = irandom_range(_border.x - _border.left, _border.x + _border.right);
		var inst_drop = choose(obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans,
						obj_drop_orange_ink_sans, obj_drop_orange_ink_sans,
						obj_drop_black_ink_sans, obj_drop_black_ink_sans,
						obj_drop_blue_ink_sans,
						obj_drop_green_ink_sans);
		instance_create_depth(x0, _border.y - _border.up - 5, fight_depth.bullet_outside_hight, inst_drop, {
			direction: 270,
			image_angle: direction + 90,
			use_gravity_force: false
		});
	}
}

// Капли летят сбоку
if (_id == 0 && attack_num == 1) {
	update_0_1 = function (pow) {
		var x0 = choose(_border.x - _border.left - 4, _border.x + _border.right + 4);
		var y0 = irandom_range(_border.y - _border.up - 40, _border.y + _border.down - 15);
		var inst_dir = (x0 == _border.x - _border.left - 4) ? irandom_range(280, 360) : irandom_range(180, 260);
		var inst_drop = choose(obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans,
						obj_drop_orange_ink_sans, obj_drop_orange_ink_sans,
						obj_drop_black_ink_sans, obj_drop_black_ink_sans,
						obj_drop_blue_ink_sans,
						obj_drop_green_ink_sans);
		instance_create_depth(x0, y0, fight_depth.bullet_outside_hight, inst_drop, {
			speed: irandom_range(0.5 + pow * 0.1, 1.5),
			direction: inst_dir,
			image_angle: direction + 90,
			use_gravity_force: false
		});
	}
}

// Кисть на 72 градуса
if (_id == 1 && attack_num == 0) {
	update_1_0 = function (pow) {
		repeat (pow > 2 ? 1 : 1) {
			var coord = [];
			coord = rand_side_from(_border.x - _border.left - 8, _border.y - _border.up - 8, _border.x + _border.right + 8, _border.y + _border.down + 8);
			instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, obj_brush_ink_sans, {
				image_angle: point_direction(coord[0], coord[1], _soul.x, _soul.y) + 225,
				side: -1,
				angle_speed_const: -1,
				max_acc: 8
			});
		}
	}
}

// Кисть на 360 градусов
if (_id == 1 && attack_num == 1 || _id == 3) {
	update_1_1 = function () {
		var brush_side = irandom_range(0, 3);
		var coord_x, coord_y;
		if (brush_side == 0) {
			coord_x = _border.x - _border.left - 12;
			coord_y = _border.y - _border.up - 12;
		}
		if (brush_side == 1) {
			coord_x = _border.x + _border.right + 12;
			coord_y = _border.y - _border.up - 12;
		}
		if (brush_side == 2) {
			coord_x = _border.x + _border.right + 12;
			coord_y = _border.y + _border.down + 12;
		}
		if (brush_side == 3) {
			coord_x = _border.x - _border.left - 12;
			coord_y = _border.y + _border.down + 12;
		}
		instance_create_depth(coord_x, coord_y, fight_depth.bullet_outside_hight, obj_brush_ink_sans, {
			image_angle: point_direction(coord_x, coord_y, _soul.x, _soul.y) + 225,
			side: brush_side,
			angle_speed_const: 1,
			max_acc: 18
		});
	}
}

// Наводящиеся гастербластеры
if (_id == 2 && attack_num == 0 || _id == 3) {
	update_2_0 = function (pow) {
		repeat (pow > 3 ? 2 : 1) { create_aiming_gasterblaster(obj_gasterblaster_aiming_ink_sans, _soul); }
	}
}

// Крестовые гастербластеры
if (_id == 2 && attack_num == 1) {
	update_2_1 = function () {
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