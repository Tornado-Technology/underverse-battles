function UIButton() constructor {
	width = 0;
	height = 0;
	offset_x = 0;
	offset_y = 0;
	padding = 0;
	
	is_binded = false;
	bind = input.action;
	
	hover = false;
	is_focus = false;
	needs_focus = false;
	is_multi_touch = false;
	can_be_on_pause = true;
	
	device_index = undefined; // Mobile
	
	// I don't work with memory leaks with Events
	// Because use functions
	on_hover = function(_self) { }
	on_held = function(_self) { }
	on_press = function(_self) { }
	on_release = function(_self) { }
	
	/// @param {Real} width
	/// @param {Real} height
	static set_size = function(width, height) {
		self.width = width;
		self.height = height;
		return self;
	}
	
	static set_padding = function(padding) {
		self.padding = padding;
		return self;
	}
	
	static set_bind_input = function(bind) {
		self.is_binded = true;
		self.bind = bind;
		return self;
	}
	
	static set_on_hover = function(callback) {
		self.on_hover = callback;
		return self;
	}
	
	static set_on_held = function(callback) {
		self.on_held = callback;
		return self;
	}
	
	static set_on_press = function(callback) {
		self.on_press = callback;
		return self;
	}
	
	static set_on_release = function(callback) {
		self.on_release = callback;
		return self;
	}
	
	static set_can_be_on_pause = function(value) {
		can_be_on_pause = value;
		return self;
	}
	
	static set_hover = function(position_x, position_y) {
		if (!is_enable_interaction) return;
		
		var point_x1 = position_x - padding - offset_x * scale_x;
		var point_y1 = position_y - padding - offset_y * scale_y;
		var point_x2 = position_x + padding + (width - offset_x - 1) * scale_x;
		var point_y2 = position_y + padding + (height - offset_y - 1) * scale_y;
		
		hover = point_in_rectangle_gui(point_x1, point_y1, point_x2, point_y2);
		if (development_mode) draw_rectangle_color(point_x1, point_y1, point_x2, point_y2, c_red, c_red, c_red, c_red, true);
		
		if (is_multi_touch) { 
			device_index = point_in_rectangle_gui_multi_touch(point_x1, point_y1, point_x2, point_y2);
			hover = device_index != undefined;
		}
	}
	
	static update = function(position_x, position_y) {
		if (!is_enable_interaction || can_be_on_pause && global.pause_game) return;
		
		set_hover(position_x, position_y);
		
		if (is_auto_focus ? hover && is_focus : false) {
			is_focus = false;
		}
		
		if (is_auto_focus ? is_focus : false) {
			hover = true;
		}
		
		if (!is_auto_focus) {
			if (mouse_check_button_pressed(mb_left, device_index) && hover && !is_focus) {
				on_hover(self);
				focus();
				return;
			}
		}
		
		if (hover && (is_auto_focus ? true : is_focus)) {
			if (!is_focus) {
				on_hover(self);
			}
			
			var holding = mouse_check_button(mb_left, device_index);
			
			if (holding) {
				on_held(self);
			}
			
			if (mouse_check_button_pressed(mb_left, device_index)) {
				on_press(self);
			}
			
			// Check releasing
			if (mouse_check_button_released(mb_left, device_index)) {
				on_release(self);
			}
			
			pressed = holding;
		}
		
		if (pressed) {
			var holding = mouse_check_button(mb_left, device_index);
			
			if (holding) {
				on_held(self);
			}
			
			// Check releasing
			if (holding != pressed && pressed) {
				on_release(self);
			}
			
			pressed = holding;
		}
		
		if (is_binded && (needs_focus && is_focus || !needs_focus)) {
			if (input_check_pressed(bind)) {
				on_press(self);
				keyboard_clear_lastkey();
			}
			if (input_check_held(bind)) {
				on_held(self);
			}
			if (input_check_released(bind)) {
				on_release(self);
				keyboard_clear_lastkey();
			}
		}
	}
	
	/// @param {Bool} value
	static set_focus = function(value) {
		if (value == is_focus) return;
		is_focus = value;
	}
	
	static focus = function() {
		is_focus = true;
	}
	
	static unfocus = function() {
		is_focus = false;
	}
}