event_inherited();

is_moving = false;

trigger_distance = 60;
trigger_direction_left = 225;
trigger_direction_right = 315;

obj_volleyball_minigame.on_round_start.connect(function() {
	is_moving = true;
});

obj_volleyball_minigame.on_fall_ball.connect(function() {
	is_moving = false;
	sprite_index = init_sprite;
});