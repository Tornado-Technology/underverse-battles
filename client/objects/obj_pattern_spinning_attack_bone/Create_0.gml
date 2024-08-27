bone_scale = 2;
bone_scale_step = 0.1;

callback = function() {
	bone_instances_counst = 14;
	soul_instance = create_soul(border_instance.x - 10, border_instance.y - 40 + 20 , battle_soul_type.blue);
	var size_bone = 0;
	var bone_instance_x;
	var i = 0;
	repeat(3) {
		create_moving_platforms(border_instance.x - border_instance.left + border_instance.right - 10, border_instance.y - 40 + 20 * i, 1, 4, 1, 0);
		i += 2;
	}
	
	i = 0;
	repeat (bone_instances_counst) {
		bone_instance_x = (border_instance.x - border_instance.left + 5) + 10 * i;
		bone_instances[i] = create_bone(bone_instance_x, border_instance.y + border_instance.down + 6, bone_shaking, 0, size_bone, 90, 0);
		bone_instances[i].change_scale(1, 0.1);
		i++;
	}

	update();		
	time_source_start(time_source_update_start);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var cood = fight_random_integer(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
	var bone_x = choose(border_instance.x - border_instance.left - fight_random_integer(10, 30),  border_instance.x + border_instance.right + fight_random_integer(10, 30));
	
	var bone_instance_0 = instance_create_depth(bone_x, cood, fight_depth.bullet_outside_hight, bone);
	bone_instance_0.speed_const = 3.5 + _power * 0.1;
	
	random_number = fight_random_integer(2, 13);
	
	bone_moving = bone_instances[random_number];
	bone_moving.shake();
}

update_shot = function() {
	bone_moving.speed_const = 3.4 + _power * 0.1;
	bone_instances[random_number] = create_bone(bone_moving.xstart, bone_moving.ystart, bone_shaking, 0, 0, bone_moving.direction, bone_moving.image_angle);
	bone_instances[random_number].change_scale(1, 0.1);
	audio_play_sound_plugging(snd_spare_up);
}

var period = 58 - (_power) * 2;
var repeats = 6 + _power * 3;

time_source_update_shot = time_source_create(time_source_game, 1/3, time_source_units_seconds, function (bone_old, bone_new) {
	update_shot();
});

time_source_update_start = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
	time_source_start(time_source_update_shot);
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});
