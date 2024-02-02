event_inherited();

// Type
color_type = battle_soul_type.orange;

// Movement
_speed = 1.8 * dtime;

is_dashing = false;
can_dash = false;
invulnerability = false;

controlled = true;

new_image_angle = 0;

is_changing_side = false;
side_controller = undefined;
side_controller_previous = undefined;

// Change direction
change_direction = function(side) {
	switch (side) {
		case dir.up:
			movement_speed_x = 0;
			movement_speed_y = -_speed;
			new_image_angle = 180;
			audio_play_sound_plugging(snd_emergence);
			break;
		case dir.down:
			movement_speed_x = 0;
			movement_speed_y = _speed;
			new_image_angle = 0;
			audio_play_sound_plugging(snd_emergence);
			break;
		case dir.left:
			movement_speed_x = -_speed;
			movement_speed_y = 0;
			new_image_angle = 270;
			audio_play_sound_plugging(snd_emergence);
			break;
		case dir.right:
			movement_speed_x = _speed;
			movement_speed_y = 0;
			new_image_angle = 90;
			audio_play_sound_plugging(snd_emergence);
			break;
	}
	
	controlled = false;
	time_source_start(time_source_delay);
}

// Time sources
time_source_dash = time_source_create(time_source_game, 1/6, time_source_units_seconds, function () {
	invulnerability = false;
	is_dashing = false;
	movement_speed_x /= 2;
	movement_speed_y /= 2;
});

time_source_cooldown = time_source_create(time_source_game, 2/6, time_source_units_seconds, function () {
	can_dash = true;
});
time_source_start(time_source_cooldown);

time_source_delay = time_source_create(time_source_game, 0.1, time_source_units_seconds, function () {
	controlled = true;
});