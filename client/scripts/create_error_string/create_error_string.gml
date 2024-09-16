function create_error_string(x, y, object, target_x, target_y, scale_speed) {
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, object);
	instance.target_x = target_x;
	instance.target_y = target_y;
	instance.scale_speed = scale_speed;
	
	return instance;
}