event_inherited();

depth = fight_depth.bullet_outside_hight;

damage = get_char_damage(obj_character_dream);

disable_surface = true;

half_width = sprite_width / 27;

position_left = x < obj_battle_border ? false : true;


soul_invulnerability = 20;
speed_const = 0;

move = false;
ricochet = false;
touching_walls = false;
be_ricochet = false;
result_ricochet = function () {	
	image_angle += 180 + fight_random_integer(10, 80);

}

collision = function () {	
	if (collision_line(x + (half_width), y , x, room_width, obj_solid, false, false) == noone) {
		result_ricochet();
		be_ricochet = true;	
	};

}



if (can_ricochet) {
	ricochet = true;
};

