/// @desc Defeated
if (global.fight_instance == noone) exit;
if (global.fight_instance.story_mode) exit;
if (hp > 0) exit;

if (!defeated) {
	sprite_index = defeated_animation;
	defeated = true;
	global.fight_instance.check_player_lose();
	audio_play_sound_plugging(snd_damage);
}

// Shake animation
if (x_shift > 0) {
	var shift_speed = 0.1;
	x += wave(x_shift, -x_shift, shift_speed, 0);
	x_shift -= 0.1;
}