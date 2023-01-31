function create_aiming_gasterblaster(gaster_blaster, soul) {
	var x_gb, y_gb;
	var gb_size = 60;
	var pos = irandom_range(0, 3);
	var con = room_height + gb_size;
	var rnd = irandom_range(0, con);
	switch (pos) {
		case 0:
			x_gb = 0;
			y_gb = rnd;
			break;
		
		case 1:
			x_gb = rnd;
			y_gb = con;
			break;
		
		case 2:
			x_gb = con;
			y_gb = rnd;
			break;
		
		case 3:
			x_gb = rnd;
			y_gb = 0;
			break;
	}
	
	var inst_gaster_blaster = instance_create_depth(x_gb, y_gb, fight_depth.bullet_outside_hight, gaster_blaster);
	
	inst_gaster_blaster.x_dir = soul.x;
	inst_gaster_blaster.y_dir = soul.y;
	
	return inst_gaster_blaster;
}