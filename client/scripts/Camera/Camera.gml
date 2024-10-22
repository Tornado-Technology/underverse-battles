function camera_set_position(x, y){
	var camera = global.camera_instance;
	camera.mode = camera_mode.moving;
	camera.is_using_speed = false;
	camera.overwrite_position = new Point(x, y);
}

function camera_get_position() {
	var camera = global.camera_instance;
    return camera.camera_position;
}

function camera_change_room_border(value) {
	if (!instance_exists(obj_camera)) return;
	obj_camera.is_room_border = value;
}

function camera_set_overwrite_position(x, y) {
	var camera = global.camera_instance;
	camera.mode = camera_mode.moving;
	camera.is_using_speed = true;
	camera.overwrite_position = new Point(x, y);
}

function camera_set_speed(x, y) {
	var camera = global.camera_instance;
	camera._speed = new Point(x, y);
}

function camera_set_target(x, y, is_using_speed = false) {
	with (obj_camera) {
		mode = camera_mode.target;
		target = new Point(x, y);
		self.is_using_speed = is_using_speed;
	}
}

function camera_set_object_target(object, is_using_speed = false) {
	with (obj_camera) {
		mode = camera_mode.target;
		target = object;
		self.is_using_speed = is_using_speed;
	}
}

function camera_set_zoom(zoom_size) {
	with (obj_camera) {
		zoom = zoom_size;
		zoom_required = zoom_size;
	}
}

function camera_change_zoom(num, time, has_smooth_zoom = false) {
	with (obj_camera) {
		zoom_required = num;
		zoom_speed = 1 / convert_seconds_to_steps(time);
		self.has_smooth_zoom = has_smooth_zoom;
	}
}