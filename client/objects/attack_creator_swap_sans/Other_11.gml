/// @desc Rotating bones
_time++;

switch (attack_num) {
	case 0:	// Вращающиеся кости крестом с перемещением
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 10, battle_border.right - 10);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.orange);
		
		var bone_speed = 1.5 + _power * 0.2;
		var bone_size = 6.6;
		var angle_speed = 1.2 + _power * 0.2;
		if (_time == 1) rand_num = irandom_range(0, 3);
		
		if(_time % (90 - _power * 5) == 1 && _time < 240 + 20 * _power) {
			var rand_y = choose(-10, 0, 10);
			if (rand_num == 0) {
				create_bone_spinning(_border.x - _border.left * 2, _border.y + rand_y, bone_spin_obj, bone_speed, bone_size, 0, 0, angle_speed);
				create_bone_spinning(_border.x - _border.left * 2, _border.y + rand_y, bone_spin_obj, bone_speed, bone_size, 0, 90, angle_speed);
			}
			if (rand_num == 1) {
				create_bone_spinning(_border.x + _border.right * 2, _border.y + rand_y, bone_spin_obj, bone_speed, bone_size, 180, 0, angle_speed);
				create_bone_spinning(_border.x + _border.right * 2, _border.y + rand_y, bone_spin_obj, bone_speed, bone_size, 180, 90, angle_speed);
			}
			if (rand_num == 2) {
				create_bone_spinning(_border.x - _border.left * 2, _border.y + rand_y, bone_spin_obj, bone_speed, bone_size, 0, 0, -angle_speed);
				create_bone_spinning(_border.x - _border.left * 2, _border.y + rand_y, bone_spin_obj, bone_speed, bone_size, 0, 90, -angle_speed);
			}
			if (rand_num == 3) {
				create_bone_spinning(_border.x + _border.right * 2, _border.y + rand_y, bone_spin_obj, bone_speed, bone_size, 180, 0, -angle_speed);
				create_bone_spinning(_border.x + _border.right * 2, _border.y + rand_y, bone_spin_obj, bone_speed, bone_size, 180, 90, -angle_speed);
			}
		}
		
		if (_time > 320 + 20 * _power)
			instance_destroy();
		break;
	case 1:	// Вращающиеся кости крестом по центру
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x - 30, _border.y - 30, battle_soul_type.orange);
		
		var bone_speed = 0;
		var bone_size = 8;
		var angle_speed = 1.3 + _power * 0.3;
		if (_time == 1) {
			rand_num = irandom_range(0, 1);
			if (rand_num == 1) angle_speed = -angle_speed;
			_inst1 = create_bone_spinning(_border.x, _border.y, bone_spin_obj, bone_speed, 0, 0, 0, angle_speed);
			_inst2 = create_bone_spinning(_border.x, _border.y, bone_spin_obj, bone_speed, 0, 0, 90, angle_speed);
		}
		
		if (_inst1.image_yscale < bone_size) {
			_inst1.image_yscale += 0.1;
			_inst2.image_yscale += 0.1;
		}
		
		var period = 80 - _power * 5;
		if (_time % period == 1) {
			rand_num = irandom_range(0, 1);
			if (rand_num == 0) {
				_inst1.angle_speed = -_inst1.angle_speed;
				_inst2.angle_speed = -_inst2.angle_speed;
			}
		}
		
		if (_time > 300 + 25 * _power)
			instance_destroy();
		break;
	case 2:	// Вращающиеся кости с двух сторон с перемещением
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 10, battle_border.right - 10);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.orange);
		
		var bone_speed = 1.5 + _power * 0.2;
		var bone_size = 3.2;
		var angle_speed = 1.5 + _power * 0.2;
		if(_time % (50 - _power * 5) == 1 && _time < 240 + 20 * _power) {
			var rand_side = irandom_range(0, 1);
			var rand_y = choose(-28, -15, 0, 15, 28);
			if (rand_side == 0)
				create_bone_spinning(_border.x - _border.left * 2, _border.y + rand_y, bone_spin_obj, bone_speed, bone_size, 0, 0, angle_speed);
			if (rand_side == 1)
				create_bone_spinning(_border.x + _border.right * 2, _border.y + rand_y, bone_spin_obj, bone_speed, bone_size, 180, 0, angle_speed);
		}
		if (_time > 320 + 20 * _power)
			instance_destroy();
		break;
}