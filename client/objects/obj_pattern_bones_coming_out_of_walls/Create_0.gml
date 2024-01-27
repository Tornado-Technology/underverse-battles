// Arguments: bone

bone_scale = 2;
bone_scale_step = 0.1;
num = 10;
bone_instances = [];

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange, fight_network_mode);
	
	var i = 0;
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x - border_instance.left + i * 10, border_instance.y - border_instance.up - 20, bone, 0, 1, 270, 180, fight_network_mode);
		bone_instances[i] = scale_bone(bone_instances[i], bone_scale, bone_scale_step, fight_network_mode);
		i++;
	}
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x + border_instance.right - (i - num) * 10, border_instance.y + border_instance.down + 20, bone, 0, 1, 90, 0, fight_network_mode);
		bone_instances[i] = scale_bone(bone_instances[i], bone_scale, bone_scale_step, fight_network_mode);
		i++;
	}
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x - border_instance.left - 20, border_instance.y + border_instance.down - (i - 2*num) * 10, bone, 0, 1, 0, 270, fight_network_mode);
		bone_instances[i] = scale_bone(bone_instances[i], bone_scale, bone_scale_step, fight_network_mode);
		i++;
	}
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x + border_instance.right + 20, border_instance.y - border_instance.up + (i - 3*num) * 10, bone, 0, 1, 180, 90, fight_network_mode);
		bone_instances[i] = scale_bone(bone_instances[i], bone_scale, bone_scale_step, fight_network_mode);
		i++;
	}
	audio_play_sound_plugging(snd_emergence);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var random_number = choose(2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 14, 15, 16, 17, 18, 19, 20, 22, 23, 24, 25, 26, 27, 28, 29, 32, 33, 34, 35, 36, 37, 38, 39);
	bone_moving = bone_instances[random_number];
	bone_instances[random_number] = create_bone(bone_moving.x, bone_moving.y, bone, 0, 1, bone_moving.direction, bone_moving.image_angle, fight_network_mode);
	shake_bone(bone_moving, fight_network_mode);
	bone_new = bone_instances[random_number];
}
update_shot = function () {
	bone_moving = move_bone(bone_moving, 4, bone_moving.direction, fight_network_mode);
	bone_new = scale_bone(bone_new, 2, 0.1, fight_network_mode);
	audio_play_sound_plugging(snd_spare_up);
}

var period = 40 - _power * 4;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
	time_source_start(time_source_update_shot);
}, [], -1);
time_source_update_shot = time_source_create(time_source_game, 1/3, time_source_units_seconds, function (bone_old, bone_new) {
	update_shot();
});
time_source_update_destroy = time_source_create(time_source_game, (320 + 20 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});