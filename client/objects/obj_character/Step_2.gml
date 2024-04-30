/// @desc Collision
if (is_controlled) {
	if (place_meeting(x, y, obj_wall)) {
		x = xprevious;
		y = yprevious;
		change_sprite_by_condition(sprite_index == walking_right_animation, standing_right_animation);
		change_sprite_by_condition(sprite_index == walking_left_animation, standing_left_animation);
		change_sprite_by_condition(sprite_index == walking_down_animation, standing_down_animation);
		change_sprite_by_condition(sprite_index == walking_up_animation, standing_up_animation);
	}
}