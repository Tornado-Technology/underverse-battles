if (!move) exit;

motion_set(image_angle, speed_const * dtime);
if (position_left) {
	if (collision_line(x + (half_width), y , x, room_width, obj_solid, false, false) != noone) {
		touching_walls = true;
	}
} else {
	if (collision_line(x + (half_width), y , room_width / 20, y, obj_solid, false, false) != noone) {
		touching_walls = true;
	}
}

if (ricochet && touching_walls && !be_ricochet) {
	collision();
}