// Arguments: bone, rotating_bone

bone_scale = 1.2;
bone_scale_step = 0.1;
num = 10;
bone_instances = [];
random_number = 0;

callback = function() {
	var offset = 40;
	var side_random = fight_random_choose(dir.up_left, dir.up_right, dir.down_left, dir.down_right);
	var angle = side_random + 90;
	
	var soul_position = new Vector2(border_instance.x - border_instance.left + offset, border_instance.y - border_instance.up + offset);
	if (side_random == dir.up_right) {
		soul_position = new Vector2(border_instance.x + border_instance.right - offset, border_instance.y - border_instance.up + offset);
	}
	if (side_random == dir.down_left) {
		soul_position = new Vector2(border_instance.x - border_instance.left + offset, border_instance.y + border_instance.down - offset);
	}
	if (side_random == dir.down_right) {
		soul_position = new Vector2(border_instance.x + border_instance.right - offset, border_instance.y + border_instance.down - offset);
	}
	
	create_soul(soul_position.x, soul_position.y, battle_soul_type.red);
	
	var rotating_bone_instance = instance_create_depth(border_instance.x, border_instance.y, fight_depth.bullet_outside_hight, rotating_bone, {
		image_yscale: 0
	});
	rotating_bone_instance.image_angle = 180 - angle;
	rotating_bone_instance.speed_spinning = 1.4 + _power * 0.2;
	rotating_bone_instance.change_scale(9, 1);
	
	var i = 0;
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x - border_instance.left + i * 10, border_instance.y - border_instance.up - 5, bone, 0, 0, 270, 180);
		bone_instances[i].change_scale(bone_scale, bone_scale_step);
		i++;
	}
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x + border_instance.right - (i - num) * 10, border_instance.y + border_instance.down + 5, bone, 0, 0, 90, 0);
		bone_instances[i].change_scale(bone_scale, bone_scale_step);
		i++;
	}
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x - border_instance.left - 5, border_instance.y + border_instance.down - (i - 2*num) * 10, bone, 0, 0, 0, 270);
		bone_instances[i].change_scale(bone_scale, bone_scale_step);
		i++;
	}
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x + border_instance.right + 5, border_instance.y - border_instance.up + (i - 3*num) * 10, bone, 0, 0, 180, 90);
		bone_instances[i].change_scale(bone_scale, bone_scale_step);
		i++;
	}
	audio_play_sound_plugging(snd_emergence);
	
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	random_number = fight_random_choose(2, 3, 4, 5, 6, 7, 8, 9, 12, 13, 14, 15, 16, 17, 18, 19, 22, 23, 24, 25, 26, 27, 28, 29, 32, 33, 34, 35, 36, 37, 38, 39);
	bone_moving = bone_instances[random_number];
	bone_moving.shake();
}

update_shot = function() {
	bone_moving.speed_const = 4;
	bone_instances[random_number] = create_bone(bone_moving.xstart, bone_moving.ystart, bone, 0, 1, bone_moving.direction, bone_moving.image_angle);
	bone_instances[random_number].change_scale(1, 0.1);
	audio_play_sound_plugging(snd_spare_up);
}

var period = 40 - _power * 4;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
	time_source_start(time_source_update_shot);
}, [], -1);

time_source_update_shot = time_source_create(time_source_game, 1/3, time_source_units_seconds, function() {
	update_shot();
});

time_source_update_destroy = time_source_create(time_source_game, (320 + 30 * _power) / 60, time_source_units_seconds, function() {
	instance_destroy();
});