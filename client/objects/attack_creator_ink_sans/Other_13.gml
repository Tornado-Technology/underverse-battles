/// @desc Ink blast
_time++;

_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
if (battle_border_start_animation_end()) exit;
		
var soul_random_position = Vector2(choose(_border.x - _border.left/2, _border.x + _border.right/2), choose(_border.y - _border.up/2, _border.y + _border.down/2));
_soul = create_soul(soul_random_position.x, soul_random_position.y, battle_soul_type.red);

if (_time == 1) {
	instance_create_depth(_border.x, _border.y, fight_depth.bullet_outside_hight, obj_ink_ball_ink_sans);
}

// Ink gasterblasters
var period = 100;
var amount = 4;
if(_time % period == 0 && _time <= period * amount) {
	create_aiming_gasterblaster(obj_gasterblaster_aiming_ink_sans, _soul);
}

// Broomie
period = 80;
amount = 5;
if (_time % period == 1 && _time <= period * amount) {
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
	_inst.max_acc = 20;
}
if (_time % period >= 30 && _time % period <= 67 && _time <= period * amount) {
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

if (_time >= 540)
	instance_destroy();