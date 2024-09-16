/// @param {Real} side
function cutscene_dialog_set_side(side = dir.up) {
	if (instance_exists(instance_dialog)) {
		instance_dialog.side = side;
		instance_dialog.shift = side == dir.down ? 180 : 0;
	}
	
	return true;
}