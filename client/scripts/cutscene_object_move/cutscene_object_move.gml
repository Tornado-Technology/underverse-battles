/// @param {Id.Instance} object
/// @param {Function} callback
/// @param {Real} speed
function cutscene_object_move(object, callback, _speed) {
	if (!instance_exists(object)) return false;

	var target_position = callback();
	object.x = approach(object.x, target_position.x, _speed);
	object.y = approach(object.y, target_position.y, _speed);
		
	return object.x == target_position.x && object.y == target_position.y;
}