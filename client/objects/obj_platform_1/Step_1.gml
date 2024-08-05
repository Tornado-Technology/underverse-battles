speed_const = approach(speed_const, const_speed, 0.01 * dtime);

if (can_move) {
	motion_set(_angle, speed_const * dtime);
};

var border_left = obj_battle_border.x - obj_battle_border.left;
var border_right = obj_battle_border.x + obj_battle_border.right - 5 * image_xscale;

if(collision_circle(obj_battle_border.x, obj_battle_border.y + obj_battle_border.down, radius, object_index, false, false)) {
	_angle = the_blow_angle;
};
	
if (x >= border_right) {
	_angle = 180;	
};

if (x <= border_left) {
	_angle = 0;	
};

