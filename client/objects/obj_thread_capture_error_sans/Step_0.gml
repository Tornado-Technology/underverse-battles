if (!can_move) exit;

if (capture) {
	if(!instance_exists(capture_obj_instance) || image_xscale <= -1) {
		instance_destroy();	
	}
	
	capture_obj_instance.x = x + image_xscale;	
	capture_obj_instance.y = y + 6;
}

image_xscale += (capture ? -scale_speed : scale_speed) * dtime;
image_angle = point_direction(x, y, target_x, target_y);
var distance =  point_distance(x + image_xscale, y,  target_x, y);

if(distance < 10) {
	capture_obj_instance = instance_create_depth(x + image_xscale, y, fight_depth.bullet_outside_hight, capture_obj);
	capture = true;
}
