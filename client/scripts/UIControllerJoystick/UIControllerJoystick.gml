function UIControllerJoystick() {
	var instance = new ClassUIControllerJoystick();
	instance.init();
	
	return instance;
}

function __input(value) constructor {
	pressed = value;
	hold = value;
	
	static foreach = function(delegate) {
		var values = variable_struct_get_names(self);
		
		for (var i = 0; i < array_length(values); i++) { delegate(values[i], self); }
	}
}

function ClassUIControllerJoystick() constructor {
	handle_image = spr_ui_controls_joystick_handle;
	border_image = spr_ui_controls_joystick_border;
	
	self.input = {};
	self.input[$ vk_up] = new __input(false);
	self.input[$ vk_down] = new __input(false);
	self.input[$ vk_right] = new __input(false);
	self.input[$ vk_left] = new __input(false);
	
	input_vector = new Vector2();
	handle = UIImageButton(handle_image);
	border = UIImageButton(border_image);
	
	death_color = c_black;
	is_show_death_radius = true;
	death_radius = 0;
	is_enable = true;
	
	background_color = c_white;
	
	delta_angle = 40;
	
	is_active = false;
	
	radius = 0;
	
	scale_x = 1.5;
	scale_y = 1.5;
	
	border_scale_x = 1;
	border_scale_y = 1;
	
	handle_x = -1;
	handle_y = -1;
	
	handle_scale_x = 1;
	handle_scale_y = 1;
	
	length_x = sprite_get_width(border_image) / 2 * scale_x * border_scale_x;
	length_y = sprite_get_height(border_image) / 2 * scale_y * border_scale_y;
	
	pressed = false;
	
	alpha = 1;
	
	static init = function() {
		handle.is_multi_touch = true;
		border.is_multi_touch = true;
	}
	
	static input_update = function() {
		var _angle = get_angle();
		
		// Reset
		var delegate = function(field, _input) { _input[$ field] = false; }
		self.input[$ vk_up].foreach(delegate);
		self.input[$ vk_down].foreach(delegate);
		self.input[$ vk_right].foreach(delegate);
		self.input[$ vk_left].foreach(delegate);
		
		if (!is_active || !is_enable) return;
		
		// Right
		if ((270 + delta_angle <= _angle && _angle <= 360) || (0 <= _angle && _angle <= 90 - delta_angle)) {
			self.input[$ vk_right].hold = true;
			self.input[$ vk_right].pressed = pressed;
		}
		
		// Down
		if (delta_angle <= _angle && _angle <= 180 - delta_angle) {
			self.input[$ vk_down].hold = true;
			self.input[$ vk_down].pressed = pressed;
		}
		
		// Left
		if (90 + delta_angle <= _angle && _angle <= 270 - delta_angle) {
			self.input[$ vk_left].hold = true;
			self.input[$ vk_left].pressed = pressed;
		}
		
		// Up
		if (180 + delta_angle <= _angle && _angle <= 360 - delta_angle) {
			self.input[$ vk_up].hold = true;
			self.input[$ vk_up].pressed = pressed;
		}
	}
	
	static draw = function(position_x, position_y) {
		var handle_new_x = mouse_gui_x;
		var handle_new_y = mouse_gui_y;
		
		// Draw border
		border.scale_x = scale_x * border_scale_x;
		border.scale_y = scale_y * border_scale_y;
		border.draw(position_x, position_y, alpha);
		
		if (is_enable) {
			if (point_in_elipse(handle_new_x, handle_new_y, position_x, position_y, length_x, length_y)) {
				handle_x = handle_new_x;
				handle_y = handle_new_y;
			} else {
				var angle_c = new Vector2(handle_new_x - position_x, handle_new_y - position_y).math_angle(true);
				var cs = cos(angle_c);
				var sn = sin(angle_c);
				var angle_t = arctan2(length_x / 2 * sn, length_y / 2 * cs);
				cs = cos(angle_t);
				sn = sin(angle_t);
				handle_x = position_x  + length_x * cs;
				handle_y = position_y  + length_y * sn;
			}
		
			if (!border.pressed) {
				handle_x = position_x;
				handle_y = position_y;
			}
			
			if (mouse_check_button_pressed(mb_left) && !pressed) { 
				pressed = true; 
			} else { pressed = false; }
			
		} else {
			handle_x = position_x;
			handle_y = position_y;
		}
		
		// Draw handle
		handle.draw(handle_x, handle_y, alpha);
		
		// Get input
		var deltaVector = new Vector2(handle_x, handle_y).sub(position_x, position_y);
		var raduis = deltaVector.math_length();
		
		input_vector = deltaVector.divis(raduis, raduis);
		
		// Death raduis
		is_active = raduis > death_radius;
		
		if (raduis <= death_radius) {
			input_vector = new Vector2();
		}
		
		if (is_show_death_radius) {
			draw_set_alpha(0.5);
			draw_set_color(c_black);
			
			draw_circle(position_x, position_y, death_radius, false);
			draw_reset();
		}
		
		// Power
		var _power = raduis / length_x;
		input_vector.multi(_power, _power);
		
		input_update();
		
		delete deltaVector;
	}
	
	static has_input = function(_input) {
		return variable_struct_exists(self.input, _input);
	}
	
	static get_input = function(_input) {
		if (!has_input) return;
		
		return self.input[$ _input];
	}
	
	static get_angle = function() {
		var _angle = input_vector.math_angle(false);
		
		if (_angle < 0) {
			return 360 + _angle;
		}
		
		return _angle;
	}
	
	static change_alpha = function(value) {
		alpha = value;
	}
}