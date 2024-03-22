/// @desc Collision & Collider soul

collider_soul.x = x;
collider_soul.y = y;
collider_soul.image_angle = image_angle;

if (!instance_exists(obj_battle_border)) exit;

border_delta_x = obj_battle_border.x - obj_battle_border.xprevious;
border_delta_y = obj_battle_border.y - obj_battle_border.yprevious;

var direction_center_arena = point_direction(x, y, obj_battle_border.x,  obj_battle_border.y);

border_force_x = 0;
border_force_y = 0;

has_collision = false;
has_collision_up = false;
has_collision_down = false;
has_collision_left = false;
has_collision_right = false;


if  (obj_battle_border.spining) {
	if (place_meeting(x, y, obj_solid)) {
		x = xprevious;
		y = yprevious;
		move_contact_solid(direction_center_arena, 3);	
	};
}
else {
	if (collision_line(x - half_width, y, 0, y, obj_solid, false, false) == noone) {
		x = xprevious;
		has_collision = true;
		has_collision_left = true;
		border_force_x = border_delta_x;
	};
	
	if (collision_line(x + half_width, y, room_width, y, obj_solid, false, false) == noone) {
		x = xprevious;
		has_collision = true;
		has_collision_right = true;
		border_force_x = border_delta_x;
	};
	
	if (collision_line(x, y - half_height, x, 0, obj_solid, false, false) == noone) {
		y = yprevious;
		has_collision = true;
		has_collision_up = true;
		border_force_y = border_delta_y;
	};
	
	if (collision_line(x, y + half_height, x, room_height, obj_solid, false, false) == noone) {
		y = yprevious;
		has_collision = true;
		has_collision_down = true;
		border_force_y = border_delta_y;
	};
};

x += border_force_x;
y += border_force_y;

event_user(0); // Projectile collision