// Arguments: bone

bone_scale = 2;
bone_scale_step = 0.1;
num = 12;
bone_instances = [];
random_number = 0;

time_source_start_moving = time_source_create(time_source_game, 20 / 60, time_source_units_seconds, function () {
		bone_spinning.speed_spinning = 2 + _power * 0.1;
})

callback = function () {
	var angle =  choose(360, 45);
	var offset
	var soul_position 
	var side_random = fight_random_choose(dir.up, dir.down, dir.left, dir.right);
	var size_bone = 1.5;
	
	if (angle == 360) {
		offset = 50;
		 soul_position = new Vector2(border_instance.x - border_instance.left + offset, border_instance.y - border_instance.up + offset);
		if (side_random == dir.down) {
			soul_position = new Vector2(border_instance.x + border_instance.right - offset, border_instance.y - border_instance.up + offset);
		};
		if (side_random == dir.left) {
			soul_position = new Vector2(border_instance.x - border_instance.left + offset, border_instance.y + border_instance.down - offset);
		};
		if (side_random == dir.right) {
			soul_position = new Vector2(border_instance.x + border_instance.right - offset, border_instance.y + border_instance.down - offset);
		};
	}
	else {
		offset = 45;
		 soul_position = new Vector2(border_instance.x, border_instance.y - border_instance.up + offset);
		if (side_random == dir.down) {
			soul_position = new Vector2(border_instance.x, border_instance.y + border_instance.down - offset);
		}
		if (side_random == dir.left) {
			soul_position = new Vector2(border_instance.x - border_instance.left + offset, border_instance.y);
		}
		if (side_random == dir.right) {
			soul_position = new Vector2(border_instance.x + border_instance.right - offset, border_instance.y);
		}
	}
	
	create_soul(soul_position.x, soul_position.y, battle_soul_type.red);
	
	offset = 23;
	var i = 0;
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x + border_instance.right - offset - i * 10, border_instance.y - border_instance.up - 20, bone, 0, size_bone, 270, 180);
		bone_instances[i].change_scale(bone_scale, bone_scale_step);
		i++;	
	}
	repeat (num) {
		bone_instances[i] = create_bone(border_instance.x + border_instance.right - offset - (i - num) * 10, border_instance.y + border_instance.down + 20, bone, 0, size_bone, 90, 0);
		bone_instances[i].change_scale(bone_scale, bone_scale_step);
		i++;
	}
	repeat (num + 2) {
		bone_instances[i] = create_bone(border_instance.x - border_instance.left - 15, border_instance.y + border_instance.down - (i - 1.9 * num) * 10, bone, 0, size_bone, 0, 270);
		bone_instances[i].change_scale(bone_scale, bone_scale_step);
		i++;
	}
	repeat (num + 2) {
		bone_instances[i] = create_bone(border_instance.x + border_instance.right + 15, border_instance.y - border_instance.up  + (i - 3 * num) * 10, bone, 0, size_bone, 180, 90);
		bone_instances[i].change_scale(bone_scale, bone_scale_step);
		i++;
	}
	
	
	bone_spinning =  instance_create_depth(border_instance.x + 2, border_instance.y, fight_depth.bullet_outside_hight, obj_bone_spinning_papyrus, {
		image_angle: angle == 360 ? (angle / choose(2, 4)) : (45 + choose(0, 90, 90 * 2, 90 * 3))	
	});
	
	with(bone_spinning) {
		sprite_set_offset(sprite_index, 5, 9);	
	};
	
	bone_spinning.change_scale(20, 0.2);

	
	
	audio_play_sound_plugging(snd_emergence);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_start_moving);
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
	bone_instances[random_number].change_scale(bone_scale, 0.1);
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