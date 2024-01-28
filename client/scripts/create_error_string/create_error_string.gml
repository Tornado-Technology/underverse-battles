function create_error_string(x, y, object, target_x, target_y, scale_speed, send_data = fight_network_mode) {
	if (send_data) send_battle_object_error_string(x, y, object, target_x, target_y, scale_speed);
	
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, object);
	instance.x_dir = target_x;
	instance.y_dir = target_y;
	instance.scale_speed = scale_speed;
	
	return instance;
}