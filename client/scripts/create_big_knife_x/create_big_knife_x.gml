function create_big_knife_x(x, y, object, direction, angle, point_stop_x, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_big_knife_x(x, y, object, direction, angle, point_stop_x, storage_index);
	
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, object);
	instance.direction = direction;
	instance.image_angle = angle;
	instance.point_stop_x = point_stop_x;
	return instance;
}