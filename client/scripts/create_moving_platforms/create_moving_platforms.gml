function create_moving_platforms(_x, _y, _num, _xscale, _dist, _speed, _id) {
	if (!instance_exists(obj_battle_border))
		exit;
	// пересоздание платформ
	if (array_length(first) > _id) {
		for (var i = first[_id]; i < last[_id]; ++i) {
			if	(_platforms[i].x > obj_battle_border.x + obj_battle_border.right + 50 and _speed > 0) or
				(_platforms[i].x < obj_battle_border.x - obj_battle_border.left - 50 and _speed < 0) {
				instance_destroy(_platforms[i]);
				_platform = instance_create_depth(_x, _y, fight_depth.bullet_outside_hight, obj_platform);
				_platform.image_xscale = _xscale;
				_platform._speed = _speed;
				_platforms[i] = _platform;
			}
		}
		exit;
	}
	
	//начальное создание платформ
	var i = 0;
	first[_id] = array_length(_platforms);
	repeat (_num) {
		_platform = instance_create_depth(_x + i * _dist * sign(_speed), _y, fight_depth.bullet_outside_hight, obj_platform);
		_platform.image_xscale = _xscale;
		_platform._speed = _speed;
		_platforms[array_length(_platforms)] = _platform;
		++i;
	}
	last[_id] = array_length(_platforms);
}