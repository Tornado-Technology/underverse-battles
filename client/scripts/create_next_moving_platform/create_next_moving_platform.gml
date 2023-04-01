function create_next_moving_platform(_x, _y, _num, _xscale, _dist, _speed) {
		var _platform = instance_create_depth(_x, _y, fight_depth.bullet_outside_hight, obj_platform);
		_platform.image_xscale = _xscale;
		_platform.const_speed = _speed;
		return _platform;
}