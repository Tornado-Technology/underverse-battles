function create_gasterblaster(gaster_blaster, x_gb, y_gb, x_dir, y_dir, _angle, fly_time = 1/6, charge_time = 1, flyout_time = 15/60, destroy_time = 1/6, var_struct = {}) {
	var_struct.x_dir = x_dir;
	var_struct.y_dir = y_dir;
	var_struct.image_angle = _angle;
	var_struct.fly_time = fly_time;
	var_struct.charge_time = charge_time;
	var_struct.flyout_time = flyout_time;
	var_struct.destroy_time = destroy_time;
	return instance_create_depth(x_gb, y_gb, fight_depth.bullet_outside_hight, gaster_blaster, var_struct);
}