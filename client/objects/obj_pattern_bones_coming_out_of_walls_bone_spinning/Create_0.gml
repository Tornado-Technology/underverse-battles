// Arguments: bone

bone_scale = 2;
bone_scale_step = 0.1;
num = 19;
bone_instances = [];
random_number = 0;

callback = function () {
	 create_soul(border_instance.x - 10, border_instance.y, battle_soul_type.red);
	var size_bone = 1.5;
	
	var i = 0;
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x - border_instance.left + i * 10, border_instance.y - border_instance.up - 20, bone, 0, size_bone, 270, 180);
		bone_instances[i].change_scale(bone_scale, bone_scale_step);
		i++;
	}
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x + border_instance.right - (i - num) * 10, border_instance.y + border_instance.down + 20, bone, 0, size_bone, 90, 0);
		bone_instances[i].change_scale(bone_scale, bone_scale_step);
		i++;
	}
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x - border_instance.left - 20, border_instance.y + border_instance.down - (i - 2*num) * 10, bone, 0, size_bone, 0, 270);
		bone_instances[i].change_scale(bone_scale, bone_scale_step);
		i++;
	}
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x + border_instance.right + 20, border_instance.y - border_instance.up + (i - 3*num) * 10, bone, 0, size_bone, 180, 90);
		bone_instances[i].change_scale(bone_scale, bone_scale_step);
		i++;
	}
	
	
	bone_spinning =  instance_create_depth(border_instance.x, border_instance.y, fight_depth.bullet_outside_hight,obj_bone_spinning_papyrus);
	with(bone_spinning) {
		sprite_set_offset(sprite_index, 5, 9);	
	}
	
	bone_spinning.change_scale(20, 1);
	bone_spinning.speed_spinning = 2 + _power * 0.1;
	
	
	audio_play_sound_plugging(snd_emergence);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	random_number = fight_random_choose(2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 25, 26, 27, 28, 29, 32, 33, 34, 35, 36, 37, 38, 39);
	bone_moving = bone_instances[random_number];
	bone_moving.shake();
}
update_shot = function () {
	bone_moving.speed_const = 4;
	bone_instances[random_number] = create_bone(bone_moving.x, bone_moving.y, bone, 0, 1, bone_moving.direction, bone_moving.image_angle);
	bone_instances[random_number].change_scale(3, 0.1);
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