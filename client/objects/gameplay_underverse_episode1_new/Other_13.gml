///@desc Начало битвы

if (instance_exists(dlg) || instance_exists(fight_underverse_00)) exit;
instance_destroy(sans_soul_half_);
	
/* Fight */
instance_create_depth(obj_camera.camera_position.x, obj_camera.camera_position.y, -100, fight_underverse_00);
	
fight_position_event = true;
