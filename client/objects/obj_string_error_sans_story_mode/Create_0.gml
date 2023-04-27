event_inherited();

following_character = noone;

increase = false;
removing = false;
attraction = false;

shoot = function (target_x, target_y) {
	increase = true;
	image_angle = point_direction(x, y, target_x, target_y);
	direction = image_angle;
	audio_play_sound_once(snd_string);
}

remove = function () {
	removing = true;
}

pull = function() {
	attraction = true;
}