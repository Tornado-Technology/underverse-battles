/// @desc Collision
if (!is_moving && !is_controlled && !is_following) exit;

if (place_meeting(x, y, obj_wall) || place_meeting(x - 1, y, obj_wall)) {
	x = xprevious;
}
if (place_meeting(x, y + 1, obj_wall) || place_meeting(x, y - 1, obj_wall)) {
	y = yprevious;
}
