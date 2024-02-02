function create_poking_bone(x, y, object, speed, size, direction, storage_index =0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_poking_bone(x, y, object, speed, size, direction, storage_index);
	
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside, object);
	instance.direction = direction;
	instance.image_angle = direction - 90;
	instance.image_yscale = size;
	instance.speed_const = speed;
	instance.set_move_back();
	
	return instance;
}