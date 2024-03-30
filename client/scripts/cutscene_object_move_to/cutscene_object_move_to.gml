/// @param {Id.Instance} object
/// @param {Real} x
/// @param {Real} y
/// @param {Real} speed
function cutscene_object_move_to(object, _x, _y, _speed) {
	if (!instance_exists(object)) return true;
	
	var object_x = object.x;
	var object_y = object.y;
	object.x = approach(object.x, _x, _speed);
	object.y = approach(object.y, _y, _speed);
	return (object_x == _x) && (object_y == _y)
}