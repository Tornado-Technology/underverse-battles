event_inherited();
spike_count = 8;

spwan = function () {
	var angle = 360 / 4;
	var i = angle;
	while(i <= 360) {
		var speed_angle = irandom_range(-3, 3);
		
		var tentacle_instance = instance_create_depth(x + dcos(i), y + -dsin(i), fight_depth.bullet_outside_hight, obj_tentacles_destroy_nightmare, { 
				image_angle: i,
				speed_angle: speed_angle
			});	
			
			tentacle_instance.time_destroy = 50;
			tentacle_instance.changes_angle = true;
			tentacle_instance.change_scale(0.4, 0.05);
		i += angle;	
	}
}
