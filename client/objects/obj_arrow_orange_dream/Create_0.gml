event_inherited();
depth = fight_depth.bullet_outside_hight;

damage = get_char_damage(obj_character_dream);

is_destroying = false;

disable_surface = true;

soul_invulnerability = 20;
speed_const = 0;


size_ricochet = _power;
half_width = sprite_width / 2;
half_height = sprite_height / 2;


result_ricochet = function (angle) {	
	var direction_center_arena = point_direction(x, y, obj_battle_border.x,  obj_battle_border.y);

	image_angle += angle;
	move_contact_solid(direction_center_arena, speed_const);
}

move = false;
ricochet = false;
touching_walls = false;

collision = function () {
	var collision_border = function (angle) {
		result_ricochet(angle);
		size_ricochet--;
	};	
	
	if (size_ricochet == -1) {
		exit;
	};
	
	if (place_meeting(x + lengthdir_x(speed_const, image_angle), y, obj_solid)) {
		collision_border(90);
	};
	if (place_meeting(x, y + lengthdir_y(speed_const, image_angle), obj_solid)) {
		collision_border(irandom_range(85, 95));
	};
}

if (irandom_range(1, 100) <= (15 + _power * 10)) {
	ricochet = true;
};
