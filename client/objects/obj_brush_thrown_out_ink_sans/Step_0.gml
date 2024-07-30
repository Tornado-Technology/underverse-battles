if (gradually_alpha) {
	if (image_alpha <= 1) {
		image_alpha += step * dtime;	
	};
	
	if(image_alpha >= 1) {
		gradually_alpha = false;
		ink =  instance_create_depth(x, y, fight_depth.bullet_outside_hight,  obj_drop_black_ink_sans_2, {
			target_obj: id	
		})

		ink.speed_const = speed_const;
	};
	exit;	
};



x = approach(x, position_x, speed_const * dtime);
y = approach(y, position_y, speed_const * dtime);

if (x == position_x && y == position_y) {	
	destroying = true;
};

if(destroying) {
	image_alpha -= 0.05 * dtime;
	if(image_alpha <= 0) {
		instance_destroy();	
	};
};