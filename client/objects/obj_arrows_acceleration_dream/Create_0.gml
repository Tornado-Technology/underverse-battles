event_inherited();


result_ricochet = function (angle) {
	var direction_center_arena = point_direction(x, y, obj_battle_border.x,  obj_battle_border.y) + angle;
	image_angle += angle;
	speed_const += 0.1;
	move_contact_solid(direction_center_arena, speed_const);
}


collision = function () {
	var collision_border =  function (angle) {
		result_ricochet(angle);	
	};
	var angle_x = 90;
	var angle_y = fight_random_float(80, 95);
	
	if (place_meeting(x + lengthdir_x(speed_const + 1, image_angle), y, obj_solid)) {
		collision_border(angle_x);
	};
	if (place_meeting(x, y + lengthdir_y(speed_const + 1, image_angle), obj_solid)) {
		collision_border(angle_y);
	};	
}

time_source_touching_walls = time_source_create(time_source_game, 60 / 60, time_source_units_seconds, function () {
	touching_walls = true;	
});