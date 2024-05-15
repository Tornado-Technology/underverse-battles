function create_gasterblaster(gaster_blaster, position_x, position_y, final_position_x, final_position_y, _angle, fly_time = 1/6, charge_time = 1, flyout_time = 15/60, destroy_time = 1/6) {
	var var_struct = {};
	var_struct.final_position_x = final_position_x;
	var_struct.final_position_y = final_position_y;
	var_struct.image_angle = _angle;
	var_struct.fly_time = fly_time;
	var_struct.charge_time = charge_time;
	var_struct.flyout_time = flyout_time;
	var_struct.destroy_time = destroy_time;
	
	return instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, gaster_blaster, var_struct);
}