function create_gasterblaster(gaster_blaster, x_gb, y_gb, xd, yd, ad, var_struct = {}) {
	var inst_gaster_blaster = instance_create_depth(x_gb, y_gb, fight_depth.bullet_outside_hight, gaster_blaster, var_struct);
	
	inst_gaster_blaster.x_dir = xd;
	inst_gaster_blaster.y_dir = yd;
	inst_gaster_blaster.image_angle = ad;
	
	return inst_gaster_blaster;
}