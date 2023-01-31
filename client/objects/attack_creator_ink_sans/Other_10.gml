/// @desc Inks
_time++;

_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0: // Капли падают сверху
		_border = battle_border_create(battle_border.up-25, battle_border.down-25, battle_border.left-25, battle_border.right-25);
		if (battle_border_start_animation_end()) exit;

		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);

		if (_time % (10 - _power) == 0 and _time < (360 + _power * 20)) {
			var x0 = irandom_range(_border.x - _border.left, _border.x + _border.right)
			var inst_num = choose(0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4);
			var inst_speed = 2;
			if (inst_num == 0)
				inst_drop = obj_drop_ink_sans;
			if (inst_num == 1) {
				inst_drop = obj_drop_blue_ink_sans;
				inst_speed = 1.5;
			}
			if (inst_num == 2) {
				inst_drop = obj_drop_orange_ink_sans;
				inst_speed = 1.5;
			}
			if (inst_num == 3) {
				inst_drop = obj_drop_black_ink_sans;
				inst_speed = 1.5;
			}
			if (inst_num == 4)
				inst_drop = obj_drop_green_ink_sans;
			instance_create_depth(x0, _border.y - _border.up - 4, fight_depth.bullet_outside_hight, inst_drop, {
				speed: inst_speed,
				direction: 270,
				image_angle: direction + 90
			});
		}

		if (_time >= (380 + _power * 20))
			instance_destroy();
	break;
	
	case 1: // Капли летят сбоку
		_border = battle_border_create(battle_border.up - 25, battle_border.down - 25, battle_border.left - 15, battle_border.right - 15);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		if (_time % (10 - _power) == 0 and _time < (360 + _power * 20)) {
			var x0 = choose(_border.x - _border.left - 4, _border.x + _border.right + 4);
			var y0 = irandom_range(_border.y - _border.up - 40, _border.y + _border.down - 15);
			var inst_dir = (x0 == _border.x - _border.left - 4) ? irandom_range(280, 360) : irandom_range(180, 260);
			var inst_num = irandom_range(0, 5);
			if (inst_num <= 2)
				inst_drop = obj_drop_ink_sans;
			if (inst_num == 3)
				inst_drop = obj_drop_blue_ink_sans;
			if (inst_num == 4)
				inst_drop = obj_drop_black_ink_sans;
			if (inst_num == 5)
				inst_drop = obj_drop_green_ink_sans;
			instance_create_depth(x0, y0, fight_depth.bullet_outside_hight, inst_drop, {
				speed: irandom_range(0.5 + _power * 0.1, 1.5),
				direction: inst_dir,
				image_angle: direction + 90
			});
		}
		
		if (_time >= (380 + _power * 20))
			instance_destroy();
	break;
}