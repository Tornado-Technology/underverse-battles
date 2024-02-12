function move_bone(_inst, _spd, _size, _dir, _ang){
	if (!instance_exists(_inst))
		return undefined;
	_inst.speed_const = _spd;
	_inst.image_yscale = _size;
	_inst.direction = _dir;
	_inst.image_angle = _ang;
	return _inst;
}

function create_bone(_x, _y, _obj, _spd, _size, _dir, _ang){
	var _inst = instance_create_depth(_x, _y, fight_depth.bullet_outside_hight, _obj);
	_inst = move_bone(_inst, _spd, _size, _dir, _ang);
	return _inst;
}

function create_bone_spinning(_x, _y, _obj, _spd, _size, _dir, _ang, ang_spd) {
	var _inst = instance_create_depth(_x, _y, fight_depth.bullet_outside_hight, _obj);
	_inst = move_bone(_inst, _spd, _size, _dir, _ang);
	_inst.angle_speed = ang_spd;
	return _inst;
}

function create_changing_bone(_x, _y, _obj, _spd, _size, _dir, _ang, _ysc, _back, _repeat, repeat_all = false, call_back_star = false){
	var _inst = instance_create_depth(_x, _y, fight_depth.bullet_outside_hight, _obj, {
	finish_yscale : _ysc,
	star_yscale : _size,
	});
	_inst.call_back_star = call_back_star;
	_inst = move_bone(_inst, _spd, _size, _dir, _ang);	
	_inst.time_back = _back; //for time_source_back_changing
	_inst.time_repeat_star =_repeat; //for time_source_repeat_star and call_repeat_all() 
	if (repeat_all) _inst.call_repeat_all();
	
	return _inst;
}