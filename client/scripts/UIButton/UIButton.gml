function UITextButton(text, callback = undefined) {
	return new UIButtonClass(text, spr_empty, callback); 
}

function UIImageButton(image, callback = undefined) {
	return new UIButtonClass("", image, callback); 
}


function UIButton(text, sprite = spr_empty, callback = undefined) {
	return new UIButtonClass(text, sprite, callback); 
}

/// @param {String} text
/// @param {Asset.GMSprite} sprite
/// @param {Function} callback
function UIButtonClass(text, sprite, callback) constructor {
	self.text = text;
	self.callback = callback;
	
	width = 0;
	height = 0;
	text_width = 0;
	text_height = 0;
	offset_x = 0;
	offset_y = 0;
	is_separate = false;
	sep = 0;
	w = 9999999;
	
	if (text != "") {
		width = string_real_width(text, global._font_main_determination);
		height = char_get_height("W");
		sep = 4;
	}
	
	if (sprite != spr_empty) {
		width = sprite_get_width(sprite);
		height = sprite_get_height(sprite);
		offset_x = sprite_get_xoffset(sprite);
		offset_y = sprite_get_yoffset(sprite);
	}
	
	image = sprite;
	
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
	padding = 0;
	text_color = c_white;
	text_hover_color = c_purple;
	pressed = false;
	is_animation_pressed = true;
	is_auto_focus = true;
	image_default_alpha = 1;
	is_animation_hover = false;
	is_multi_touch = false;
	
	halign = fa_center;
	valign = fa_middle;
	
	// I don't work with memory leaks with Events
	// Because use functions
	on_hover = function(_self) { };
	on_held = function(_self) { };
	on_press = function(_self) { };
	on_release = function(_self) { };
	
	/// @param {Real} width
	/// @param {Real} height
	static set_size = function(width, height) {
		self.width = width;
		self.height = height;
	}
	
	static change_text = function(text) {
		self.text = text;
		width = string_real_width(text, global._font_main_determination);
		height = char_get_height("W");
	}
	
	static set_image = function(sprite) {
		width = sprite_get_width(sprite);
		height = sprite_get_height(sprite);
		offset_x = sprite_get_xoffset(sprite);
		offset_y = sprite_get_yoffset(sprite);
		image = sprite;
	}
	
	/// @param {Real} x
	/// @param {Real} y
	static draw = function(position_x, position_y, alpha = image_default_alpha, image_rotation = 0, update_position_x = position_x, update_position_y = position_y) {
		update(update_position_x, update_position_y);
		
		draw_reset();
		
		if (!string_is_empty(text)) {
			scale_x = lerp(scale_x, (is_auto_focus ? hover : is_focus) ? text_hover_scale_x : text_scale_x, 0.5);
			scale_y = lerp(scale_y, (is_auto_focus ? hover : is_focus) ? text_hover_scale_y : text_scale_y, 0.5);
			color_merge = lerp(color_merge, (is_auto_focus ? hover : is_focus) ? 1 : 0, 0.2);
			var color = merge_color(text_color, text_hover_color, color_merge);
			draw_set_halign(halign);
			draw_set_valign(valign);
			draw_set_font(global._font_main_determination);
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
		
		if (image != spr_empty) {		
			draw_sprite_ext(image, is_animation_hover ? hover : pressed, position_x, position_y, scale_x, scale_y, image_rotation, c_white, alpha);
			draw_reset();
		}
	} 

	
	static update = function(position_x, position_y) {
		if (!is_enable_interaction) return;
		
		var point_x1 = position_x - padding - offset_x * scale_x;
		var point_y1 = position_y - padding - offset_y * scale_y;
		var point_x2 = position_x + padding + (width - offset_x - 1) * scale_x;
		var point_y2 = position_y + padding + (height - offset_y - 1) * scale_y;
		
		if (image == spr_empty || !is_animation_pressed) {
			var text_indent = 5;
			
			var shift = 2;
			var halign_shift_left = 2; var halign_shift_right = 2;
			if (halign == fa_left) { halign_shift_left = 1; halign_shift_right = 4; }
			if (halign == fa_right) { halign_shift_left = 4; halign_shift_right = 1; }
			var valign_shift_top = 2; var valign_shift_bottom = 2;
			if (valign == fa_top) { valign_shift_top = 4; valign_shift_bottom = 1; }
			if (valign == fa_bottom) { valign_shift_top = 1; valign_shift_bottom = 4; }
			
			point_x1 = position_x - padding -(is_separate ? (width > w ? w : width) : width) * scale_x / halign_shift_left - text_indent;
			point_y1 = position_y - padding - (is_separate ? (height * (width div w + 1) + sep * (width div w + 1)) / 2 : height) * scale_y / valign_shift_top - text_indent;
			point_x2 = position_x + padding + (is_separate ? (width > w ? w : width) : width) * scale_x / halign_shift_right + text_indent;
			point_y2 = position_y + padding + (is_separate ? (height * (width div w + 1) + sep * (width div w + 1)) / 2 : height) * scale_y / valign_shift_bottom + text_indent;
		}
		
		hover = point_in_rectangle_gui(point_x1, point_y1, point_x2, point_y2);
		if (development_mode) draw_rectangle_color(point_x1, point_y1, point_x2, point_y2, c_red, c_red, c_red, c_red, true);
		if (is_multi_touch) { 
			device_index = point_in_rectangle_gui_multi_touch(point_x1, point_y1, point_x2, point_y2);
			hover = device_index != undefined;
		}
		
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
			
			if (mouse_check_button_pressed(mb_left, device_index) || (is_desktop ? input_check_pressed(input.action) : false)) {
				on_press(self);
				press();
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
	
	static press = function() {
		if (callback != undefined) {
			callback(self);
		}
	}
}
