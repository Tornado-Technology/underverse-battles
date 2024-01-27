function create_moving_platforms(_x, _y, _num, _xscale, _dist, _speed, send_data = false) {
	if (send_data) send_battle_object_moving_platforms(_x, _y, _num, _xscale, _dist, _speed);
	
	var i = 0;
	var _platform;
	var _platforms = [];
	repeat (_num) {
		_platform = instance_create_depth(_x + i * _dist * sign(_speed), _y, fight_depth.bullet_outside_hight, obj_platform, {
			image_xscale: _xscale,
			const_speed: _speed,
			has_fixed_movement: false
		});
		_platforms[array_length(_platforms)] = _platform;
		++i;
	}
	return _platforms;
}