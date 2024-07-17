image_yscale = approach(image_yscale, back ? back_const : scale_const, scale_time * dtime);

if  (image_yscale >= scale_const) {
	back = true;	
};

if (image_yscale <= back_const) {
	back = false;	
};

if (instance_exists(obj_battle_soul)) {
	obj_battle_soul.image_alpha = place_meeting(x, y, obj_battle_soul) ? 0 : 1;
};
