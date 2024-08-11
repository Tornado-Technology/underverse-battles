event_inherited();
can_move = true;
damage = get_char_damage(obj_character_sans);
speed_const = 0;
scale_const = 1;
scale_time = 0;

change_scale = function(scale, step) {
	scale_const = scale;
	scale_time = step;
}
