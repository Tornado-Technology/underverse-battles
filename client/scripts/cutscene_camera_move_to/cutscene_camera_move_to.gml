function cutscene_camera_move_to(xpos, ypos, spd) {
	camera_set_overwrite_position(xpos, ypos);
	var position = camera_get_position();
	logger.debug("{0} == {1} && {2} == {3}", position.x, xpos, position.y, ypos)
	return (position.x == xpos) && (position.y == ypos);
}
