/// @param {Asset.GMSprite} sprite
function UIImageButton(index, sprite) : UIButton() constructor {
	self.index = index;
	self.image = sprite;
	
	width = sprite_get_width(sprite);
	height = sprite_get_height(sprite);
	offset_x = sprite_get_xoffset(sprite);
	offset_y = sprite_get_yoffset(sprite);
	
	hover = false;
	is_focus = false;
	
	device_index = undefined; // Mobile
	
	is_enable_interaction = true;
	
	color_merge = 0;
	scale_x = 1;
	scale_y = 1;
	pressed = false;
	is_animation_pressed = true;
	is_auto_focus = true;
	image_default_alpha = 1;
	is_animation_hover = false;
	is_multi_touch = false;
	
	// I don't work with memory leaks with Events
	// Because use functions
	on_hover = function(_self) { };
	on_held = function(_self) { };
	on_press = function(_self) { };
	on_release = function(_self) { };
	
	/// @param {Asset.GMSprite} sprite
	static set_image = function(sprite) {
		width = sprite_get_width(sprite);
		height = sprite_get_height(sprite);
		offset_x = sprite_get_xoffset(sprite);
		offset_y = sprite_get_yoffset(sprite);
		image = sprite;
		return self;
	}
	
	/// @param {Real} x
	/// @param {Real} y
	static draw = function(position_x, position_y, alpha = image_default_alpha, image_rotation = 0, update_position_x = position_x, update_position_y = position_y) {
		update(update_position_x, update_position_y);
		
		draw_reset();
		draw_sprite_ext(image, is_animation_hover ? hover : pressed, position_x, position_y, scale_x, scale_y, image_rotation, c_white, alpha);
		draw_reset();
	}
}
