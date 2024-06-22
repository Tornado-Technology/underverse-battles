event_inherited();


result_ricochet = function () {
	var direction_center_arena = point_direction(x, y, obj_battle_border.x,  obj_battle_border.y);
	var angle = new Vector2(x, y).math_dot(obj_battle_border);
	
	image_angle = lerp(image_angle, image_angle - (angle), speed_const * dtime);
	move_contact_solid(direction_center_arena, speed_const);	
	speed_const += 0.1;
}


collision = function () {
	var collision_border =  function () {
		result_ricochet();	
	};
	
	if (collision_line(x - half_width, y, 0, y, obj_solid, false, false) == noone) {
		collision_border();
	};
	
	if (collision_line(x + half_width, y, room_width, y, obj_solid, false, false) == noone) {
		collision_border();	
	};
	
	if (collision_line(x, y - half_height, x, 0, obj_solid, false, false) == noone) {
		collision_border();
	};
	
	if (collision_line(x, y + half_height, x, room_height, obj_solid, false, false) == noone) {
		collision_border();
	};
}
