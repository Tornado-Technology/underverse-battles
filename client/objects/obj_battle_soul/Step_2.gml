/// @desc Collider soul & collision invoke
if (collision_line(x, y, 0, y, obj_solid, false, false) == noone xor
	collision_line(x, y, room_width, y, obj_solid, false, false) == noone) {
	x = xprevious;
	is_inside_border_x = false;
}
if (collision_line(x, y, x, 0, obj_solid, false, false) == noone xor
	collision_line(x, y, x, room_height, obj_solid, false, false) == noone) {
	y = yprevious;
	is_inside_border_y = false;
}
if (collision_line(x, y, x, 0, obj_solid, false, false) == noone &&
	collision_line(x, y, x, room_height, obj_solid, false, false) == noone) {
	x = xprevious;
	y = yprevious;
	is_inside_border_x = false;
	is_inside_border_y = false;
}

collider_soul.x = x;
collider_soul.y = y;
collider_soul.image_angle = image_angle;

border_delta_x = obj_battle_border.x - obj_battle_border.xprevious;
border_delta_y = obj_battle_border.y - obj_battle_border.yprevious;

event_user(0); // Collision