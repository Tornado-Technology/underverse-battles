function create_next_moving_platform(_x, _y, _num, _xscale, _dist, _speed, send_data = fight_network_mode) {
	if (send_data) send_battle_object_next_moving_platform(_x, _y, _num, _xscale, _dist, _speed);
	
	return instance_create_depth(_x, _y, fight_depth.bullet_outside_hight, obj_platform, {
		image_xscale: _xscale,
		const_speed: _speed,
		has_fixed_movement: false
	});
}