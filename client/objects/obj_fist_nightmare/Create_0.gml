event_inherited();
xscale = false;
damage = get_char_damage(obj_character_nightmare);


_angle = image_angle == (0 || 180) ? -image_angle : image_angle;
outside_force_speed = -50 + speed_count * dtime;


tentacles = obj_tentacles_fist_nightmare;

change_scale = function(scale, step) {
 tentacles_instance = instance_create_depth(x, y, fight_depth.bullet_outside, tentacles);
 tentacles_instance.change_scale(scale, step);
	
	return tentacles_instance;
}

