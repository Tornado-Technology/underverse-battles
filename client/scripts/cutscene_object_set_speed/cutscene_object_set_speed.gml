/// @param {Id.Instance} object
/// @param {Real} speed
/// @param {Real} direction
function cutscene_object_set_speed(object, _speed, _direction) {
	if (!instance_exists(object)) return true;

	object.speed = _speed;
	object.direction = _direction;
		
	return true;
}