/// @description Methods

if (id_ == 0 && attack_num == 0) {
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

if (id_ == 0 && attack_num == 1) {
	var x0 = choose(_border.x - _border.left - 4, _border.x + _border.right + 4);
	var y0 = irandom_range(_border.y - _border.up - 40, _border.y + _border.down - 15);
	var inst_dir = (x0 == _border.x - _border.left - 4) ? irandom_range(280, 360) : irandom_range(180, 260);
	var inst_drop = choose(obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans,
					obj_drop_orange_ink_sans, obj_drop_orange_ink_sans,
					obj_drop_black_ink_sans, obj_drop_black_ink_sans,
					obj_drop_blue_ink_sans,
					obj_drop_green_ink_sans);
	instance_create_depth(x0, y0, fight_depth.bullet_outside_hight, inst_drop, {
		speed: irandom_range(0.5 + _power * 0.1, 1.5),
		direction: inst_dir,
		image_angle: direction + 90
	});
}