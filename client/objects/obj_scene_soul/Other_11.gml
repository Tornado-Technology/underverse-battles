/// @description Collider

if (collider_alpha > 0)
	collider_alpha -= 0.1;

if (!collider_switch)
	exit;

time += dtime;

if (time >= collider_delay) {
	collider_alpha = 1;
	time = 0;
	audio_play_sound_plugging(snd_graze);
}