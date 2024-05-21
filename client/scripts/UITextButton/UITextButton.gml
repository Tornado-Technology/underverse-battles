/// @param {Number} index
/// @param {String} text
/// @param {Asset.GMFont} font
function UITextButton(index, text, font = global._font_main_determination) : UIButton() constructor {
	self.index = index;
	self.text = text;
	self.font = font;
	
	width = string_real_width(text, font);
	height = char_get_height("W");
	text_width = 0;
	text_height = 0;
	halign = fa_center;
	valign = fa_middle;
	is_separate = false;
	sep = 0;
	w = 0;
	text_color = c_white;
	text_hover_color = c_purple;
	
	hover = false;
	is_focus = false;
	
	device_index = undefined; // Mobile
	
	is_enable_interaction = true;
	
	color_merge = 0;
	scale_x = 1;
	scale_y = 1;
	text_scale_x = 1;
	text_scale_y = 1;
	text_hover_scale_x = 1.1;
	text_hover_scale_y = 1.1;
	pressed = false;
	is_animation_pressed = true;
	is_auto_focus = true;
	is_animation_hover = false;
	is_multi_touch = false;
	
	/// @param {String} text
	/// @param {Asset.GMFont} font
	static set_text = function(text, font = self.font) {
		self.text = text;
		self.font = font;
		width = string_real_width(text, font);
		height = char_get_height("W");
		return self;
	}
	
	static set_color = function(text_color, text_hover_color) {
		self.text_color = text_color;
		self.text_hover_color = text_hover_color;
		return self;
	}
	
	static set_align = function(halign, valign = self.valign) {
		self.halign = halign;
		self.valign = valign;
		return self;
	}
	
	static set_separate = function(sep, w) {
		self.is_separate = true;
		self.sep = sep;
		self.w = w;
		return self;
	}
	
	static set_hover = function(position_x, position_y) {
		padding = 5;
			
		var shift = 2;
		var halign_shift_left = 2; var halign_shift_right = 2;
		if (halign == fa_left) { halign_shift_left = 4; halign_shift_right = 1; }
		if (halign == fa_right) { halign_shift_left = 1; halign_shift_right = 4; }
		var valign_shift_top = 2; var valign_shift_bottom = 2;
		if (valign == fa_top) { valign_shift_top = 4; valign_shift_bottom = 1; }
		if (valign == fa_bottom) { valign_shift_top = 1; valign_shift_bottom = 4; }
			
		var point_x1 = position_x - padding - (is_separate ? (width > w ? w : width) : width) * scale_x / halign_shift_left;
		var point_y1 = position_y - padding - (is_separate ? (height * (width div w + 1) + sep * (width div w + 1)) / 2 : height) * scale_y / valign_shift_top;
		var point_x2 = position_x + padding + (is_separate ? (width > w ? w : width) : width) * scale_x / halign_shift_right;
		var point_y2 = position_y + padding + (is_separate ? (height * (width div w + 1) + sep * (width div w + 1)) / 2 : height) * scale_y / valign_shift_bottom;
		
		hover = point_in_rectangle_gui(point_x1, point_y1, point_x2, point_y2);
		if (development_mode) draw_rectangle_color(point_x1, point_y1, point_x2, point_y2, c_red, c_red, c_red, c_red, true);
		
		if (is_multi_touch) { 
			device_index = point_in_rectangle_gui_multi_touch(point_x1, point_y1, point_x2, point_y2);
			hover = device_index != undefined;
		}
	}
	
	/// @param {Real} x
	/// @param {Real} y
	static draw = function(position_x, position_y, alpha = 1, update_position_x = position_x, update_position_y = position_y) {
		update(update_position_x, update_position_y);
		
		draw_reset();
		
		scale_x = lerp(scale_x, (is_auto_focus ? hover : is_focus) ? text_hover_scale_x : text_scale_x, 0.5);
		scale_y = lerp(scale_y, (is_auto_focus ? hover : is_focus) ? text_hover_scale_y : text_scale_y, 0.5);
		color_merge = lerp(color_merge, (is_auto_focus ? hover : is_focus) ? 1 : 0, 0.2);
		var color = merge_color(text_color, text_hover_color, color_merge);
		draw_set_halign(halign);
		draw_set_valign(valign);
		draw_set_font(font);
		draw_set_color(c_black);
		draw_set_alpha(alpha);
		if (is_separate) {
			draw_text_ext_transformed(position_x + 1, position_y, text, sep, w, scale_x, scale_y, 0);
			draw_text_ext_transformed(position_x - 1, position_y, text, sep, w, scale_x, scale_y, 0);
			draw_text_ext_transformed(position_x, position_y + 1, text, sep, w, scale_x, scale_y, 0);
			draw_text_ext_transformed(position_x, position_y - 1, text, sep, w, scale_x, scale_y, 0);
			draw_set_color(color);
			draw_text_ext_transformed(position_x, position_y, text, sep, w, scale_x, scale_y, 0);
		} else {
			draw_text_transformed(position_x + 1, position_y, text, scale_x, scale_y, 0);
			draw_text_transformed(position_x - 1, position_y, text, scale_x, scale_y, 0);
			draw_text_transformed(position_x, position_y + 1, text, scale_x, scale_y, 0);
			draw_text_transformed(position_x, position_y - 1, text, scale_x, scale_y, 0);
			draw_set_color(color);
			draw_text_transformed(position_x, position_y, text, scale_x, scale_y, 0);
		}
		draw_reset();
	} 
}