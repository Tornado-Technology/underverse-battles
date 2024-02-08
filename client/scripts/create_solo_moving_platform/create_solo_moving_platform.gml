function create_solo_moving_platform(x, y, scale, speed, left_station, right_station) {
	return instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_platform, {
		image_xscale: scale,
		const_speed: speed,
		has_fixed_movement: true,
		x_station_left: left_station,
		x_station_right: right_station
	});
}