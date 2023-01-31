/// @desc Frame Update
_time = approach(_time, _time_max, 1);

if (_time >= _time_max) {
	_time = 0;
	frame++;
	if (frame > frame_max) {
		frame = 0;
	}
}