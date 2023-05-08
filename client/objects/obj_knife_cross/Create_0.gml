event_inherited();

depth = fight_depth.bullet_outside_hight;

var current_player = fight_get_player(fight_get_iniciative());
damage = get_char_damage(current_player);
soul_invulnerability = get_char_invulnerability(current_player) ? 20 : 1;

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

audio_play_sound_once(snd_emergence);

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