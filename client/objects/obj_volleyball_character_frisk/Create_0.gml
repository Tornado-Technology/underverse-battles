event_inherited();

ball_collision_width = sprite_width - 4;
ball_collision_height = 10;
ball_spawn_height = 14;

is_controlled = false;
is_punched = false;

punch_direction = 270;
punch_inaccuracy = 5;
punch_speed = random_range(1.4, 1.8);
punch_force = random_range(4, 5);

init_sprite = spr_frisk_standing_down;
standing_sprite = spr_frisk_volleyball_standing;
walking_up_sprite = spr_frisk_volleyball_walking_up;
walking_down_sprite = spr_frisk_volleyball_walking_down;
walking_left_sprite = spr_frisk_volleyball_walking_left;
walking_right_sprite = spr_frisk_volleyball_walking_right;
punch_sprite = spr_frisk_volleyball_punch;

control = function(_speed = speed_const) {
	is_controlled = true;
	speed_const = _speed;
}

set_uncontrolled = function() {
	is_controlled = false;
	sprite_index = init_sprite;
}

punch = function() {
	obj_volleyball_minigame.last_puncher = id;
	is_punching = true;
	is_punched = false;
	sprite_index = punch_sprite;
	time_source_start(time_source_cooldown);
}

obj_volleyball_minigame.on_round_start.connect(function() {
	control();
});

obj_volleyball_minigame.on_fall_ball.connect(function() {
	set_uncontrolled();
});