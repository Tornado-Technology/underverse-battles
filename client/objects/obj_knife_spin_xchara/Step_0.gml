if(_rotating) {
	image_angle += _speed_rotate * dtime;
	exit;
}

motion_set(image_angle, _speed * dtime);