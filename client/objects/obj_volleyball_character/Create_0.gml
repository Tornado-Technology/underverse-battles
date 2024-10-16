speed_const = 1;

start_position_x = 0;
start_position_y = 0;

ball_collision_width = 4;
ball_collision_height = 4;
ball_spawn_height = 30;

movement_x = 0;
movement_y = 0;

is_punching = false;
is_scored_ball = false;

ball = obj_volleyball_ball;

punch_direction = 90;
punch_inaccuracy = 0;
punch_speed = 2;
punch_force = 3;

init_sprite = spr_empty;
standing_sprite = spr_empty;
walking_up_sprite = spr_empty;
walking_down_sprite = spr_empty;
walking_left_sprite = spr_empty;
walking_right_sprite = spr_empty;
punch_sprite = spr_empty;

// Methods

stand = function() {
	sprite_index = standing_sprite;
}

punch = function() {
	ball.punch(calculate_punch_direction(), punch_speed, punch_force);
	obj_volleyball_minigame.last_puncher = id;
	is_punching = true;
	sprite_index = punch_sprite;
	time_source_start(time_source_cooldown);
	
	if (audio_is_playing(!snd_ball_punch)) {
		audio_play_sound_at(snd_ball_punch, x, y, 0, 180, 600, 1, false, 2);
	}
}

calculate_punch_direction = function() {
	return punch_direction + irandom_range(-punch_inaccuracy, punch_inaccuracy);
}

change_sprite_by_condition = function(condition, new_sprite) {
	if (condition) {
		sprite_index = new_sprite;
	}
}

// Time sources

time_source_cooldown = time_source_create(time_source_game, 3/5, time_source_units_seconds, function() {
	is_punching = false;
});