if (!move) exit;

motion_set(image_angle, speed_const * dtime);

var offset = 50;
var border_left = obj_battle_border.x - obj_battle_border.left;
var border_up = obj_battle_border.y - obj_battle_border.up;
var border_right = obj_battle_border.x + obj_battle_border.right;
var border_down = obj_battle_border.y + obj_battle_border.down;

if(collision_rectangle(border_left + offset, border_up + offset, border_right - offset, border_down - offset, id, false, false) != noone) {
	touching_walls = true
};



if (ricochet && touching_walls && !is_destroying){
	collision();
	touching_walls = false;
};

if (is_destroying) {
	touching_walls = false;
	image_alpha -= 0.1;
	if (image_alpha <= 0) {
		instance_destroy();
	};	
}