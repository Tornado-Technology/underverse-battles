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

function camera_set_speed(vector){
	var camera = global.camera_instance;
	
	if (argument_count > 1) {
		var _x = argument[0];
		var _y = argument[1];
		vector = new Point(_x, _y);
	}
	
	camera._speed = vector;
}

function camera_set_target(obj) {
	with (obj_camera) {
		mode = camera_mode.target;
		target = obj;
		is_using_speed = false;
	}
}

function camera_set_zoom(zoom_size, zoom_target_x, zoom_target_y) {
	with (obj_camera) {
		zoom = zoom_size;
		zoom_required = zoom_size;
		
		mode = camera_mode.target;
		target = new Point(zoom_target_x, zoom_target_x);
		is_using_speed = false;
	}
}

function camera_change_zoom(num, time, zoom_target_x, zoom_target_y, has_smooth_zoom = false) {
	with (obj_camera) {
		zoom_required = num;
		zoom_speed = 1 / convert_seconds_to_steps(time);
		self.has_smooth_zoom = has_smooth_zoom;
		
		mode = camera_mode.target;
		target = new Point(zoom_target_x, zoom_target_y);
		is_using_speed = false;
	}
}