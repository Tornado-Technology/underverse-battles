event_inherited();
depth = fight_depth.bullet;


damage = get_char_damage(obj_character_nightmare);

soul_invulnerability = 60;


bullets = obj_bullets_nightmare;

keep_bullets = false;


scale_const = 0;
scale_time = 0;
back_const = image_yscale;	

back = false;

change_scale = function(scale, step) {
	scale_const = scale;
	scale_time = step;
}
