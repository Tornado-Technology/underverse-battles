depth = fight_depth.bg;
background = fight_get_background();
background_obj = fight_get_background_object();

if (background_obj != noone) {
	instance_create(background_obj);
}
