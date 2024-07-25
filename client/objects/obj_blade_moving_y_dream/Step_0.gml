if (gradually_alpha) {
	if (image_alpha <= 1) {
		image_alpha += 0.1;	
	};	
};
	
var border_right =  obj_battle_border.x +  obj_battle_border.right + 10;
var border_left = obj_battle_border.x - obj_battle_border.left - 10;


if (x >= border_right) {
	direction = 180;	
};

if(x <= border_left) {
	direction = 0;	
};

y = center_y + (dsin(angle) - (-dsin(angle))) * (radius_y);


motion_set(direction, speed_count * dtime);
angle += speed_spinnig * dtime;