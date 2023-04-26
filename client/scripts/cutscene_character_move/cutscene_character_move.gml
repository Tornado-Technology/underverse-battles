/// @param {Id.Instance} object
/// @param {Real} x
/// @param {Real} y
/// @param {Real} speed
function cutscene_character_move(object, x, y, speed) {
	if (instance_exists(object)) {
		object.move(x, y, speed);
	}
	
	return true;
}