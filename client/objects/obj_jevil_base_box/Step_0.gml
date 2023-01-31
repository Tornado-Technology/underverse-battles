/// @desc Movoment
x = approach(x, target_position.x, _speed.x);
y = approach(y, target_position.y, _speed.y);

if (x == target_position.x && y == target_position.y) {
	event_user(0);
	//audio_play_sound_plugging(snd_bomb);
	instance_create_depth(x, y, 0, obj_jevil_boom);
	instance_destroy();
}