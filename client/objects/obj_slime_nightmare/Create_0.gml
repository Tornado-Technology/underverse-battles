event_inherited();

damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 60;

bullets = obj_drop_nightmare;

keep_bullets = false;

scale_const = 0;
scale_time = 0;
back_const = image_yscale;	

back = false;

change_scale = function(scale, step) {
	scale_const = scale;
	scale_time = step;
}
