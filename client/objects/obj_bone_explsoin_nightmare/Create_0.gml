event_inherited();
time_explsoin = 30;

spwan_tentacles = function () {
	var radine = 0;
	var angle = 360 / 4;
	var i = angle;
	while(i <= 360) {
	var tentacle_instance = instance_create_depth(x + dcos(i), y + -dsin(i), fight_depth.bullet_outside_hight, obj_tentacles_destroy_nightmare, { image_angle : i});	
		tentacle_instance.timer_destroy = 50;
		tentacle_instance.change_scale(0.5, 0.05);
	i += angle;	
	}
}

time_source_explso = time_source_create(time_source_game, time_explsoin / 60, time_source_units_seconds, function () {
	spwan_tentacles();
});

time_source_start(time_source_explso);