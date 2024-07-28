if (gradually_alpha) {
	if (image_alpha <= 1) {
		image_alpha += 0.1;	
	};	
};
	
var border_right =  obj_battle_border.x +  obj_battle_border.right + 10;
var border_left = obj_battle_border.x - obj_battle_border.left - 10;
var border_down =  obj_battle_border.y +  obj_battle_border.down - 5;
var border_up = obj_battle_border.y - obj_battle_border.up + 5;

if(vertical) {
	if (y >= border_down) {
		direction = 90;	
	};

	if(y <= border_up) {
		direction = 270;	
	};
	x = center_x + (dcos(angle) - (-dcos(angle))) * (radius);
	
} else {
	if (x >= border_right) {
		direction = 180;	
	};

	if(x <= border_left) {
		direction = 0;	
	};
	y = center_y + (dsin(angle) - (-dsin(angle))) * (radius);
}


motion_set(direction, speed_count * dtime);
angle += speed_spinnig * dtime;