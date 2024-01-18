///@param {Asset.GMObject} gaster_blaster
///@param {Asset.GMInstance} target
function create_aiming_gasterblaster(gaster_blaster, target, fly_time = 1/6, charge_time = 1, flyout_time = 15/60, destroy_time = 1/6, send_object_creation = false) {
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
	
	var var_struct = {};
	var_struct.x_dir = target.x;
	var_struct.y_dir = target.y;
	var_struct.fly_time = fly_time;
	var_struct.charge_time = charge_time;
	var_struct.flyout_time = flyout_time;
	var_struct.destroy_time = destroy_time;
	
	if (send_object_creation) send_battle_object_gasterblaster(x_gb, y_gb, gaster_blaster, target.x, target.y, 0, fly_time, charge_time, flyout_time, destroy_time);
	
	return instance_create_depth(x_gb, y_gb, fight_depth.bullet_outside_hight, gaster_blaster, var_struct);
}