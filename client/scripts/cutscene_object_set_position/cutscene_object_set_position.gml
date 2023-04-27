/// @param {Id.Instance} object
/// @param {Real} x
/// @param {Real} y
function cutscene_object_set_position(object, x, y) {
	if (!instance_exists(object)) return false;

	object.x += x;
	object.y += y;
		
	return true;
}