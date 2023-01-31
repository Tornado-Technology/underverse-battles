/// @description Knives
_time++;

_power = (_power == 4) ? 5 : _power;

va_x1_ = obj_camera.camera_position.x;
va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
va_y1_ = obj_camera.camera_position.y;
va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;

switch (attack_num) {
	case 0:	// самонаводящиеся ножи
	_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
	if (battle_border_start_animation_end()) exit;

	_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
	
		if(_time % (18 - _power*2) == 1) {
			var rX = irandom_range(va_x1_ + 64, va_x2_ - 64);
			var rY = irandom_range(va_y1_ + 24, va_y2_ - 24);
			while(point_in_rectangle(rX, rY, _border.x - _border.left, _border.y - _border.up, _border.x + _border.right, _border.y + _border.down)) {
				var rX = irandom_range(va_x1_ + 64, va_x2_ - 64);
				var rY = irandom_range(va_y1_ + 24, va_y2_ - 24);
			}
	
			var _inst = instance_create_depth(rX, rY, 0, obj_knife_spin_xchara);
			_inst._target_angle = point_direction(_inst.x, _inst.y, _soul.x, _soul.y);
		}

		if(_time > 250 + _power * 20)
			instance_destroy();
		break;
	
	case 1:	// самонаводящиеся взрыв ножей
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;

		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);

		if(_time % (24 - _power*2) == 0) {
			var coord = [];
			coord = rand_side_from(_border.x - _border.left - 60, _border.y - _border.up - 40, _border.x + _border.right + 60, _border.y + _border.down + 40);
			instance_create_depth(coord[0], coord[1], 0, obj_knife_blast_xchara);
		}

		if(_time > 260 + _power * 34)
			instance_destroy();
		break;
		
	case 2:	// ножи справа и слева
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		if (battle_border_start_animation_end()) exit;

		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);


		if(_time % (14 - _power*2) == 1) {
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

		if(_time > 260 + _power * 34)
			instance_destroy();
		break;
		
	case 3:	// ножи по кругу
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		if (battle_border_start_animation_end()) exit;

		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		if (_time == 1) {
			_side = 90;
			step = 20;
			rot = irandom_range(0, 1);
			count = 18 + _power*6;
			new_timer = 0;
		}
		
		var dist_ = 120;
		if(_time % (15 - _power * 2) == 1 and count > 0) {
			var rX = _border.x - dist_ * cos(_side*pi/180);
			var rY = _border.y - dist_ * sin(_side*pi/180);
			_knife = instance_create_depth(rX, rY, 0, obj_knife_directed_xchara);
			_knife.image_alpha = 0;
			_knife._target_angle = point_direction(_knife.x, _knife.y, _border.x, _border.y);
			if (rot == 0)
				_side += step;
			else
				_side -= step;
			count--;
		}
		else if(count <= 0 and _time % (15 - _power*2) == 0)
			new_timer++;
		
		if (_time % (80 - _power * 5) == 1) {
			var rand_num = irandom_range(0, 1);
			if (rand_num == 0)
				rot = rot ? 0 : 1;
		}
			
		if (new_timer == 6 + _power)
			instance_destroy();
		break;
}
