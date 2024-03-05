// Argument : bone, bone_spinning, spining_bone

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.blue);

	var i = 0; 
	repeat(20) {
		create_bone(border_instance.x - border_instance.left + 3 + i * 8, border_instance.y + border_instance.down + 3, bone, 0, 5, 0, 0);
		i++;
	};
	 
	create_moving_platforms(border_instance.x - 8, border_instance.y + 5, 1, 5, 0, 0);
	create_moving_platforms(border_instance.x - 8, border_instance.y - 25, 1, 5, 0, 0);

	var bone_scale = 9.4;
	bone_instances[0] = create_bone(border_instance.x - border_instance.left, border_instance.y, bone_spinning, 0, 0, 0, -45);
	bone_instances[0].change_scale(bone_scale, 0.1);
	bone_instances[1] = create_bone(border_instance.x + border_instance.right, border_instance.y, bone_spinning, 0, 0, 135, 45);
	bone_instances[1].change_scale(bone_scale, 0.1);
	
	var bone_angle_speed = (_power div 2 + 1);
	bone_instances[0].angle_speed = bone_angle_speed;
	bone_instances[1].angle_speed = bone_angle_speed;
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	
	var side = fight_random_integer(0, 1);
	var bone_instance;
			
	if (side == 0) {
		bone_instance = instance_create_depth(border_instance.x - border_instance.left - 10, soul_instance.y, fight_depth.bullet_outside, spining_bone);
		bone_instance.speed_const = 2 + _power * 0.1;
		bone_instance.direction_const = 0;
	} else {
		bone_instance = instance_create_depth(border_instance.x + border_instance.right + 10, soul_instance.y, fight_depth.bullet_outside, spining_bone);
		bone_instance.speed_const = 2 + _power * 0.1;
		bone_instance.direction_const = 180;
	}
	audio_play_sound_plugging(snd_projectile);	
}

var period = 35 - 2 * _power;
var repeate = 10 + _power * 2;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeate - 1)

time_source_update_destroy = time_source_create(time_source_game, repeate * period / 60, time_source_units_seconds, function () {
	instance_destroy();
})