if (!move) exit;
var offset = 50;
var border_left = obj_battle_border.x - obj_battle_border.left;
var border_up = obj_battle_border.y - obj_battle_border.up;
var border_right = obj_battle_border.x + obj_battle_border.right;
var border_down = obj_battle_border.y + obj_battle_border.down;

if(collision_rectangle(border_left + offset, border_up + offset, border_right - offset, border_down - offset, id, false, false) != noone) {
	touching_walls = true
};
	

		

if (touching_walls && !be_ricochet) {
	collision();
};

if(is_bonb) {
	alpha = approach(alpha, 0, alpha_time);
	radius++;
	
	if (alpha == 0) {
		instance_destroy();
	};		
} else {
	motion_set(image_angle, speed_const * dtime);	
	
}