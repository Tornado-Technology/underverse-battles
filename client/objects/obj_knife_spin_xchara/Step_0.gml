if(_use_particle)
	event_user(0);

if(_rotating) {
	image_angle += _speed_rotate;
	exit;
}

if(image_angle != _target_angle) {
	if(image_angle + _speed_rotate > _target_angle) {
		image_angle = _target_angle;
		audio_play_sound_plugging(snd_projectile);
	}
	else
		image_angle += _speed_rotate;
}

motion_set(image_angle, _speed);