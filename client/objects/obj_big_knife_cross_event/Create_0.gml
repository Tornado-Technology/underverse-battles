event_inherited();

depth = fight_depth.bullet_outside_hight;

damage = 5;
soul_invulnerability = 20;

is_spining = false;
is_moving = false;
is_moving_up = false;

step = 0;

direction = 0;
image_alpha = 0;
speed_max = 0;
speed_angle = 0;
speed_const = 0.2;

point_stop_x = 0;
point_stop_y = 0;

audio_play_sound_plugging(snd_emergence);

// Methods
spin = function(spd) {
	is_spining = true;
	speed_angle = spd;
}

spin_stop = function() {
	is_spining = false;
}

move = function(spd) {
	is_moving = true;
	speed_max = spd;
}

move_stop = function() {
	is_moving = false;
}

move_up = function() {
	is_moving_up = true;
}