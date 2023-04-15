/// @param {Id.Instance} object
/// @param {Function} callback
/// @param {Real} speed
function cutscene_object_set_position(object, x, y) {
	if (!instance_exists(object)) return false;

	object.x += x;
	object.y += y;
		
	return true;
}