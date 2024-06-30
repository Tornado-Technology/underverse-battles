event_inherited();
depth = fight_depth.bullet;


damage = get_char_damage(obj_character_nightmare);

soul_invulnerability = 60;


bullets = obj_bullets_nightmare;

keep_bullets = false;

angle_bullets = 0;

angle = 0; 

speed_spning = 0;
scale_const = 0;
scale_time = 0;
back_const = image_yscale;	
time_attack = 20 ?? 30;

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

spwan_bullets = function (angle) {
	keep_bullets = true;
	angle_bullets = angle;
	//time_source_start(time_source_spwan_bullets);
}

time_source_spwan_bullets = time_source_create(time_source_game, time_attack / 60, time_source_units_seconds, function () {
	var bullets_instance = instance_create_depth(x + irandom(sprite_width), y, fight_depth.bullet_outside_hight, bullets, {
		image_angle: angle_bullets,
		direction: angle_bullets,
		speed_const: speed_const
	});	
		
}, [], -1);