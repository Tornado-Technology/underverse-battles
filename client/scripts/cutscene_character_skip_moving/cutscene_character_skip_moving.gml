/// @param {Id.Instance} object
/// @param {Real} x
/// @param {Real} y
/// @param {Real} speed
function cutscene_character_skip_moving(object) {
	if (instance_exists(object)) {
		object.skip_moving();
	}
	
	return true;
}