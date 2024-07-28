event_inherited();

depth = fight_depth.bullet_outside_hight;

damage = get_char_damage(obj_character_dream);

disable_surface = true;

soul_invulnerability = 20;
speed_const = 0;
start_timer = false;

move = false;
ricochet = false;
touching_walls = false;
be_ricochet = false;
result_ricochet = function (angle) {	
	image_angle += angle; 
}

collision = function () {
	var collision_border = function (angle) {
		result_ricochet(angle);
		be_ricochet = true;
	};	
	if (place_meeting(x + lengthdir_x(speed_const, image_angle), y, obj_solid)) {
		collision_border(90);
	};
	if (place_meeting(x, y + lengthdir_y(speed_const, image_angle), obj_solid)) {
		collision_border(irandom_range(85, 95));
	};
}

time_source_touching = time_source_create(time_source_game, ((36 - speed_const) / 60), time_source_units_seconds, function (){
	touching_walls = true;
})


if (can_ricochet) {
	ricochet = true;
};

