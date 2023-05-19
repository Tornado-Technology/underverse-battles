if (!is_crush) {
	x -= movement_speed;
	
	if (place_meeting(x, y, obj_banana_minigame_player)) {
		var player = instance_place(x, y, obj_banana_minigame_player);
	
		if (player != noone) {
			is_crush = true;
			obj_banana_minigame_manager.bscore -= subtracting_score;
		}
	}
	
	exit;
}

image_speed = 0;
image_index = 1;

rotate_time = approach(rotate_time, rotate_time_max, 1);

if (rotate_time >= rotate_time_max) {
	rotate_time = 0;
	image_angle += 90;
}

x += crush_speed_x;
y += crush_speed_y;

if (!sound_was_play) {
	if (sound_yelp != undefined) {
		audio_play_sound_plugging(sound_yelp);
	}
	
	if (sound_hit != undefined) {
		audio_play_sound_plugging(sound_hit);
	}
	
	sound_was_play = true;
}
