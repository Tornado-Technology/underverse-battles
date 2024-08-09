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
result_ricochet = function () {	
	var direction_center_arena = point_direction(x, y, obj_battle_border.x,  obj_battle_border.y);

	image_angle += fight_random_integer(10, 80);

}

collision = function () {
	var collision_border = function () {
		result_ricochet();
		be_ricochet = true;	
	};	
	
	var offset = 35;
	var border_left = obj_battle_border.x - obj_battle_border.left;
	var border_up = obj_battle_border.y - obj_battle_border.up;
	var border_right = obj_battle_border.x + obj_battle_border.right;
	var border_down = obj_battle_border.y + obj_battle_border.down;
	if(collision_rectangle(border_left + offset, border_up + offset, border_right - offset, border_down - offset, id, false, false) == noone) {
		collision_border();
	}
}



if (can_ricochet) {
	ricochet = true;
};

