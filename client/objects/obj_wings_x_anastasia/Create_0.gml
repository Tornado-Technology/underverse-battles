event_inherited();

index = 0;

speed_const = 1;
disappearance = false;
spaw_wave = function () {
	var wave_instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_wave_from_wings_XAnastasia)		
	
	wave_instance.speed_const = speed_const;
	wave_instance.speed_feathers = speed_const;
	wave_instance.image_angle = image_angle + 290;
	return wave_instance;
}