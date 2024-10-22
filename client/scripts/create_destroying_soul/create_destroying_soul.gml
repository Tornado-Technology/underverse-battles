function create_destroying_soul(callback) {
	if (!instance_exists(obj_camera)) return;
	instance_create_depth(obj_camera.x + room_width / 2, obj_camera.y + room_height / 2, fight_depth.soul, obj_soul_destroyed, {
		callback: callback
	});
}