x = approach(x, position_target_x, speed_const * dtime);


if(destroying) {
	alpha = approach(alpha, 0, alpha_time);
	radius++;
	
	if (alpha == 0) {
		instance_destroy();
	};		
} else {
	if(x == position_target_x) {
		spwan();	
	};	
};