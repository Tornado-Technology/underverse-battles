global.gameplay_instance = noone;

if (is_mobile || mobile_mode) {
	global.__ui_controls_instance.enable = false;
	global.__ui_walk_virtual_buttons_instance.is_enable = false;
}

var i = 0;
repeat(array_length(persistent_rooms)) {
	room_goto(persistent_rooms[i]);
	room_persistent = false;
	logger.debug($"{room_persistent}")
}

camera_set_position(0, 0);