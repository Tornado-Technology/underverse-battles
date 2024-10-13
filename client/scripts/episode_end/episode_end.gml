function episode_end() {
	instance_destroy(obj_inventory);
	instance_destroy(global.gameplay_instance);
	camera_resize();
	room_goto(room_menu);
}