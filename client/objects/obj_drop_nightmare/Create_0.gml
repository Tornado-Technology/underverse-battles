event_inherited();
damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 20;

image_alpha = 0;

time_source_fall_exists = false;
is_falling = false;
acceleration = 0;
speed_max = 4;

set_fall = function(initial_speed, acceleration) {
	self.acceleration = acceleration;
	speed_const = initial_speed;
	direction = 270;
	image_angle = 0;
	
	time_source_fall_exists = true;
	time_source_fall = time_source_create(time_source_game, 0.5, time_source_units_seconds, function () {
		is_falling = true;
	});
	time_source_start(time_source_fall);
}