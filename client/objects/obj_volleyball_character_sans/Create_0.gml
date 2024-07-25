event_inherited();

ball_collision_width = sprite_width - 2;
ball_collision_height = 10;
ball_spawn_height = 16;

trigger_direction_left = 45;
trigger_direction_right = 135;

punch_direction = 270;
punch_inaccuracy = 8;
punch_speed = random_range(1.5, 2.4);
punch_force = random_range(4, 5);

init_sprite = spr_sans_volleybro_standing_down;
standing_sprite = spr_sans_volleyball_standing;
walking_up_sprite = spr_sans_volleyball_walking_up;
walking_down_sprite = spr_sans_volleyball_walking_down;
walking_left_sprite = spr_sans_volleyball_walking_left;
walking_right_sprite = spr_sans_volleyball_walking_right;
punch_sprite = spr_sans_volleyball_punch;

calculate_punch_direction = function() {
	return choose(
		punch_direction + irandom_range(-punch_inaccuracy, punch_inaccuracy),
		point_direction(ball.x, ball.y, obj_volleyball_character_asgore.x, obj_volleyball_character_asgore.y),
		point_direction(ball.x, ball.y, obj_volleyball_character_alphys.x, obj_volleyball_character_alphys.y)
	);
}