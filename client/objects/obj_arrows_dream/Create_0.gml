event_inherited();

depth = fight_depth.bullet_outside_hight;

damage = get_char_damage(obj_character_dream);

disable_surface = true;

soul_invulnerability = 20;
speed_const = 0;

move = false;
ricochet = false;
touching_walls = false;


size_ricochet = _power;
half_width = sprite_width / 2;
half_height = sprite_height / 2;


result_ricochet = function () {	
	var direction_center_arena = point_direction(x, y, obj_battle_border.x,  obj_battle_border.y);
	var angle = new Vector2(x, y).math_dot(obj_battle_border);
	
	image_angle = lerp(image_angle, image_angle - (angle), speed_const * dtime);
	move_contact_solid(direction_center_arena, speed_const);
}


collision = function () {
	var collision_border = function () {
		result_ricochet();
		size_ricochet--;
	};	
	
	if (size_ricochet == -1) {
		exit;
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

if (irandom_range(1, 100) <= (15 + _power * 10)) {
	ricochet = true;
};