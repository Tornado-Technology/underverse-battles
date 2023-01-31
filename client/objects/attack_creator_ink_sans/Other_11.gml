/// @desc Broomie
_time++;

_border = battle_border_create(battle_border.up-30, battle_border.down-30, battle_border.left-30, battle_border.right-30);
if (battle_border_start_animation_end()) exit;

_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);

switch (attack_num) {
	case 0: // Кисть на 72 градуса
		var period = 80 - _power * 10;
		if (_time % period == 1 and _time <= period * (6 + _power)) {
			repeat (_power > 2 ? 1 : 1) {
				var coord = [];
				coord = rand_side_from(_border.x - _border.left - 8, _border.y - _border.up - 8, _border.x + _border.right + 8, _border.y + _border.down + 8);
				_inst = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, obj_brush_ink_sans);
				_inst.image_angle = point_direction(coord[0], coord[1], _soul.x, _soul.y) + 225;
			}
		}

		if (_time >= period * (7 + _power)) { instance_destroy(); }
	break;
	
	case 1: // Кисть на 360 градусов
		var period = 100 - _power * 10;
		if (_time % period == 1 and _time <= period * (5 + _power)) {
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
		if (_time % period >= 30 and _time % period <= 67) {
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

		if (_time >= period * (5 + _power)) { instance_destroy(); }
	break;
}