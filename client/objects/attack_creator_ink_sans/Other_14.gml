/// @description Methods

if (id_ == 0 && attack_num == 0) {
	update_0_0 = function () {
		var x0 = irandom_range(_border.x - _border.left, _border.x + _border.right);
		var inst_drop = choose(obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans,
						obj_drop_orange_ink_sans, obj_drop_orange_ink_sans,
						obj_drop_black_ink_sans, obj_drop_black_ink_sans,
						obj_drop_green_ink_sans);
		instance_create_depth(x0, _border.y - _border.up - 4, fight_depth.bullet_outside_hight, inst_drop, {
			direction: 270,
			image_angle: direction + 90
		});
	}
}

if (id_ == 0 && attack_num == 1) {
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
			image_angle: direction + 90
		});
	}
}

if (id_ == 1 && attack_num == 0) {
	update_1_0 = function (pow) {
		repeat (pow > 2 ? 1 : 1) {
			var coord = [];
			coord = rand_side_from(_border.x - _border.left - 8, _border.y - _border.up - 8, _border.x + _border.right + 8, _border.y + _border.down + 8);
			_inst = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, obj_brush_ink_sans);
			_inst.image_angle = point_direction(coord[0], coord[1], _soul.x, _soul.y) + 225;
		}
	}
}

if (id_ == 1 && attack_num == 1) {
	update_1_1 = function () {
		side = irandom_range(0, 3);
		var coord_x, coord_y;
		if (side == 0) {
			coord_x = _border.x - _border.left - 12;
			coord_y = _border.y - _border.up - 12;
		}
		if (side == 1) {
			coord_x = _border.x + _border.right + 12;
			coord_y = _border.y - _border.up - 12;
		}
		if (side == 2) {
			coord_x = _border.x + _border.right + 12;
			coord_y = _border.y + _border.down + 12;
		}
		if (side == 3) {
			coord_x = _border.x - _border.left - 12;
			coord_y = _border.y + _border.down + 12;
		}
		_inst = instance_create_depth(coord_x, coord_y, fight_depth.bullet_outside_hight, obj_brush_ink_sans);
		_inst.image_angle = point_direction(coord_x, coord_y, _soul.x, _soul.y) + 225;
		_inst.max_acc = 18;
	}
	
	update_1_1_2 = function () {
		if (side == 0) {
			_inst.x += 3;
			_inst.side = 1;
		}
		else if (side == 1) {
			_inst.y += 3;
			_inst.side = 1;
		}
		else if (side == 2) {
			_inst.x -= 3;
			_inst.side = 1;
		}
		else if (side == 3) {
			_inst.y -= 3;
			_inst.side = 1;
		}
	}
}

if (id_ == 2 && attack_num == 0) {
	update_2_0 = function (pow) {
		repeat (pow > 3 ? 2 : 1) { create_aiming_gasterblaster(obj_gasterblaster_aiming_ink_sans, _soul); }
	}
}

if (id_ == 2 && attack_num == 1) {
	update_2_1 = function () {
		var _gb;
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