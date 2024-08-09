if (gradually_alpha) {
	if (image_alpha <= 1) {
		image_alpha += step * dtime;	
	};
	
	if(image_alpha >= 1) {
		spwan_ink();
		gradually_alpha = false;
	};
	exit;	
};

	
if(changes_angle && !changes) {
	var spd = (9 + (speed_const * 0.01));
	
	image_angle = approach(image_angle, angle +  point_direction(x, y, position_x, position_y), spd * dtime);
	direction = approach(direction,  point_direction(x, y, position_x, position_y),  spd  * dtime);
	if(direction == point_direction(x, y, position_x, position_y)) {
		spwan_ink();
		changes = true;	
		changes_angle = false;
	};	
};

var offset = 20;

if (point_in_rectangle(x, y, position_x - offset, position_y - offset, position_x + offset, position_y + offset)) {
	if(!changes) {
		changes_direction();
	} else {
		is_destroying = true;		
	};
}; 

motion_set(direction, speed_const * dtime);

if (is_destroying) {
	image_alpha -= 0.05 * dtime;
	if(image_alpha <= 0) {
		instance_destroy();	
	};
};