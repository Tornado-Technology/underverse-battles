/// @desc Collision & Collider soul

if (instance_exists(collider_soul)) {
	collider_soul.x = x;
	collider_soul.y = y;
	collider_soul.image_angle = image_angle;
}

var border = obj_battle_border;

if (!instance_exists(obj_battle_border)) exit;

border_delta_x = obj_battle_border.x - obj_battle_border.xprevious;
border_delta_y = obj_battle_border.y - obj_battle_border.yprevious;

border_force_x = 0;
border_force_y = 0;

has_collision = false;
has_collision_up = false;
has_collision_down = false;
has_collision_left = false;
has_collision_right = false;

if (collision_line(x - half_left, y, 0, y, obj_solid, false, false) == noone) {
	x = xprevious;
	has_collision = true;
	has_collision_left = true;
	border_force_x = border_delta_x;
}
	
if (collision_line(x + half_right, y, room_width, y, obj_solid, false, false) == noone) {
	x = xprevious;
	has_collision = true;
	has_collision_right = true;
	border_force_x = border_delta_x;
}
	
if (collision_line(x, y - half_up, x, 0, obj_solid, false, false) == noone) {
	y = yprevious;
	has_collision = true;
	has_collision_up = true;
	border_force_y = border_delta_y;
}
	
if (collision_line(x, y + half_down, x, room_height, obj_solid, false, false) == noone) {
	y = yprevious;
	has_collision = true;
	has_collision_down = true;
	border_force_y = border_delta_y;
}

x += border_force_x;
y += border_force_y;

event_user(0); // Projectile collision