event_inherited();
depth = fight_depth.bullet;


draw_no_in_arena = false;

damage = get_char_damage(obj_character_nightmare);

soul_invulnerability = 60;


scale_const = 0;
scale_time = 0;
back_const = image_yscale;	

back = false;

change_scale = function(scale, step) {
	scale_const = scale;
	scale_time = step;
}