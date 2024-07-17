event_inherited();
depth = fight_depth.bullet;


damage = get_char_damage(obj_character_nightmare);

soul_invulnerability = 60;

if (!variable_instance_exists(id, "time_attack")) {
	time_attack = 60;
};

bullets = obj_bullets_nightmare;

keep_bullets = false;

angle = 0; 

speed_spning = 0;
scale_const = 0;
scale_time = 0;
back_const = image_yscale;	

back = false;


move_circle = false;

moving_circle = function (center_x, center_y, radius) {
	move_circle = true;
	self.center_x = center_x;
	self.center_y = center_y;
	self.radius = radius;
}


change_scale = function(scale, step) {
	scale_const = scale;
	scale_time = step;
}
