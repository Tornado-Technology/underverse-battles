/// @param {Id.Instance} object
/// @param {Real} x
/// @param {Real} y
/// @param {Real} speed
function cutscene_character_move_to(object, x, y, speed) {
	if (instance_exists(object)) {
		object.move_to(x, y, speed);
	}
	
	return true;
}