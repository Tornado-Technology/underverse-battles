event_inherited();

damage = get_char_damage(obj_character_nightmare);
speed_const = 3;
target_position = 0;
spwan = function () {
	var radine = 0;
	var angle = 360 / 4;
	var i = angle;
	while(i <= 360) {
	var tentacle_instance = instance_create_depth(x + dcos(i), y + -dsin(i), fight_depth.bullet_outside_hight, obj_tentacles_destroy_nightmare, { image_angle : i});	
		tentacle_instance.time_destroy = 50;
		tentacle_instance.change_scale(0.4, 0.05);
	i += angle;	
	}
}

