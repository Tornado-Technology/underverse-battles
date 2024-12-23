event_inherited();

ball_collision_width = sprite_width - 2;
ball_collision_height = -12;
ball_spawn_height = 34;

trigger_distance = 70;

punch_direction = 90;
punch_inaccuracy = 3;
punch_speed = random_range(1.8, 2.2);
punch_force = random_range(4, 5);

init_sprite = spr_undyne_volleyball_standing;
standing_sprite = spr_undyne_volleyball_standing;
walking_up_sprite = spr_undyne_volleyball_walking_up;
walking_down_sprite = spr_undyne_volleyball_walking_down;
walking_left_sprite = spr_undyne_volleyball_walking_left;
walking_right_sprite = spr_undyne_volleyball_walking_right;
punch_sprite = spr_undyne_volleyball_punch;

calculate_punch_direction = function() {
	return choose(
		punch_direction + irandom_range(-punch_inaccuracy, punch_inaccuracy),
		point_direction(ball.x, ball.y, obj_volleyball_character_papyrus.x, obj_volleyball_character_papyrus.y),
		point_direction(ball.x, ball.y, obj_volleyball_character_frisk.x, obj_volleyball_character_frisk.y)
	);
}