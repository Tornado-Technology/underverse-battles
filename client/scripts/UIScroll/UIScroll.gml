function UIScroll(width, height, callback = function() {}) {
	var instance = new ClassUIScroll(width, height, callback);
	instance.init();
	
	return instance;
}

function ClassUIScroll(width, height, callback) constructor {
	self.surface_width = width;
	self.surface_height = height;
	self.callback = callback;
	shift = 0;
	max_shift = 0;
	width = surface_width;
	surface = surface_create(width, height);
	arrows = {}
	speed_scroll = 1;
	static arrow_offset_x = 10;
	static arrow_offset_y = 10;
	static arrow_width = sprite_get_width(spr_ui_arrow);
	static arrow_height = sprite_get_height(spr_ui_arrow);
	
	static scroll_up = function(_speed = speed_scroll) {
		if (shift >= 0) {
			shift -= _speed
			shift = max(shift, 0);
		}
	}
	
	static scroll_down = function(_speed = speed_scroll) {
		if (shift <= max_shift) {
			shift += _speed;
			shift = min(shift, max_shift);
		}
	}
	
	static set_scroll = function(value) {
		if (value <= max_shift && value >= 0) {
			shift = value;
		}
	}
	
	static init = function() {
		arrows.up = UIImageButton(spr_ui_arrow);
		arrows.up.padding = 5;
		arrows.up.on_held = function() {
			scroll_up();
		}
		arrows.down = UIImageButton(spr_ui_arrow);
		arrows.down.padding = 5;
		arrows.down.on_held = function() {
			scroll_down();
		}
	}
	
	static update = function() {}
	
	static draw = function(position_x, position_y) {
		if (!surface_exists(surface)) {
			surface = surface_create(surface_width, surface_height);
		}
		
		surface_set_target(surface);
		draw_clear_alpha(0, 0);
		
		var arrows_surface_x = surface_width - arrow_width - arrow_offset_x;
		var arrow_up_surface_y = arrow_offset_y + arrow_height;
		var arrow_down_surface_y = surface_height - arrow_offset_y - arrow_height;
		
		if (shift != 0) {
			arrows.up.draw(arrows_surface_x, arrow_up_surface_y, 1, 0, position_x + arrows_surface_x, position_y + arrow_up_surface_y);
		}
		
		if (shift != max_shift) {
			arrows.down.draw(arrows_surface_x, arrow_down_surface_y, 1, 180, position_x + arrows_surface_x, position_y + arrow_down_surface_y);
		}
		
		width = callback(self, shift);
		max_shift = surface_height - width >= 0 ? 0 : abs(surface_height - width);
		
		surface_reset_target();
		draw_surface(surface, position_x, position_y);
	}
}