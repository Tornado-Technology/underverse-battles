function cutscene_camera_move_to(xpos, ypos, spd) {
	camera_set_speed(spd, spd);
	camera_set_overwrite_position(xpos, ypos);
	var position = camera_get_position();
	logger.debug(global.camera_instance.target_position.to_string())
	return (position.x == xpos) && (position.y == ypos);
}
