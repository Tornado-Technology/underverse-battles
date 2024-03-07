event_inherited();

damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 20;

scale_const = 1;
scale_time = 0.1;

change_scale = function(scale, step) {
	scale_const = scale;
	scale_time = step;
}


	