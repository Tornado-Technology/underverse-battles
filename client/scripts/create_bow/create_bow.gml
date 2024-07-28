function create_bow(bow, arrow, speed_const,can_ricochet, position_x, position_y, _angle, target_time = 1/6, shot_time = 1, destroy_time = 1/6) {
	var var_struct = {
	};
	var_struct.image_angle = _angle;
	var_struct.speed_const = speed_const
	var_struct.target_time = target_time;
	var_struct.shot_time = shot_time;
	var_struct.destroy_time = destroy_time;
	var_struct.arrow = arrow;
	var_struct.can_ricochet = can_ricochet;
 
	
	return instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, bow, var_struct);
}