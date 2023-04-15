function camera_set_position(vector){
	var camera = global.camera_instance;
    
    if (argument_count > 1) {
        var _x = argument[0];
        var _y = argument[1];
        vector = Vector2(_x, _y);
    }
	
	camera.overwrite_position = vector;
    camera.is_using_speed = false;
}

function camera_get_position() {
	var camera = global.camera_instance;
    return camera.camera_position;
}

function camera_set_following(value) {
	if (!instance_exists(obj_camera)) return;
	obj_camera.following_traget = value;
	obj_camera.is_overwrite = false;
}

function camera_change_room_border(value) {
	if (!instance_exists(obj_camera)) return;
	obj_camera.is_room_border = value;
}

function camera_reset_size() {
	if (!instance_exists(obj_camera)) return;
}

function camera_set_overwrite_position(vector) {
	var camera = global.camera_instance;
	camera.is_overwrite = true;
	camera.is_using_speed = true;
	
	if (argument_count > 1) {
		var _x = argument[0];
		var _y = argument[1];
		vector = Vector2(_x, _y);
	}
	
	camera.overwrite_position = vector; 
}

function camera_set_speed(vector){
	var camera = global.camera_instance;
	
	if (argument_count > 1) {
		var _x = argument[0];
		var _y = argument[1];
		vector = Vector2(_x, _y);
	}
	
	camera._speed = vector;
}

function camera_set_taget(obj) {
	if (!instance_exists(obj_camera)) return;
	obj_camera.target = obj;
	obj_camera.is_using_speed = false;
	obj_camera.following_traget = true;
	obj_camera.is_overwrite = false;
}

function camera_resize() {
    if (!instance_exists(obj_camera)) return;
    
    with (obj_camera) {
        event_user(0);
    }
}

function camera_set_zoom(num) {
	with (obj_camera)
		zoom = num;
}

function camera_change_zoom(num, time) {
	with (obj_camera) {
		zoom_required = num;
		zoom_speed = 4/convert_seconds_to_steps(time);
	}
}