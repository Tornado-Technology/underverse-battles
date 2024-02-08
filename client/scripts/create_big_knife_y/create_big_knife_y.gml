function create_big_knife_y(x, y, object, direction, angle, point_stop_y) {
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, object);
	instance.direction = direction;
	instance.image_angle = angle;
	instance.point_stop_y = point_stop_y;
	
	return instance;
}