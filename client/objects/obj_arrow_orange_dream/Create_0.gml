event_inherited();
depth = fight_depth.bullet_outside_hight;

damage = get_char_damage(obj_character_dream);

is_destroying = false;

disable_surface = true;

soul_invulnerability = 20;
speed_const = 0;

half_width = sprite_width / 27;

position_left = x < obj_battle_border ? false : true;	


result_ricochet = function () {	
	var direction_center_arena = point_direction(x, y, obj_battle_border.x,  obj_battle_border.y);

	image_angle += fight_random_integer(10, 80);
}

move = false;
ricochet = false;
touching_walls = false;

collision = function () {
	if (collision_line(x + (half_width), y , x, room_width, obj_solid, false, false) == noone) {
		result_ricochet();
		be_ricochet = true;	
	}
}

if (can_ricochet) {
	ricochet = true;
}
