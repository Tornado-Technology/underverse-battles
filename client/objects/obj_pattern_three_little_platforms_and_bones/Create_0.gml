// Arguments: bone, rotating_bone

bone_scale = 2;
bone_scale_step = 0.1;

callback = function() {
	bone_instances_count = 12;
	soul_instance = create_soul(border_instance.x, border_instance.y - 5, battle_soul_type.blue);
	var size_bone = 0;
	var bone_instance_x;
	var i = 0;
	repeat(3) {
		create_moving_platforms(border_instance.x - border_instance.left + border_instance.right - 10, border_instance.y - 40 + 20 * i, 1, 4, 1, 0);
		i += 2;
	}
	
	i = 0;
	repeat (bone_instances_count) {
		bone_instance_x = (border_instance.x - border_instance.left + 5) + 10 * i;
		bone_instances[i] = create_bone(bone_instance_x, border_instance.y + border_instance.down + 6, bone, 0, size_bone, 90, 0);
		bone_instances[i].change_scale(1, 0.1);
		i++;
	}
	
	time_source_start(time_source_update_start);
	time_source_start(time_source_update_destroy);
	
	audio_play_sound_plugging(snd_emergence);
}

update = function() {
	var bone_direction = fight_random_choose(dir.left, dir.right);
	var bone_x = bone_direction == dir.right ? border_instance.x - border_instance.left - 50 : border_instance.x + border_instance.right + 50;
	var bone_y = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 20);
	
	var bone_instance = instance_create_depth(bone_x, bone_y, fight_depth.bullet_outside_hight, rotating_bone);
	bone_instance.speed_const = 3.4 + _power * 0.1;
	bone_instance.direction = bone_direction;
	bone_instance.speed_spinning = 3.4 + _power * 0.1;
	bone_instance.rotating = 1;
	bone_instance.image_alpha = 0;
	bone_instance.disable_surface = true;
	
	random_number = fight_random_integer(2, 9);
	
	bone_moving = bone_instances[random_number];
	bone_moving.shake();
}

update_shot = function() {
	bone_moving.speed_const = 3.4 + _power * 0.1;
	bone_instances[random_number] = create_bone(bone_moving.xstart, bone_moving.ystart, bone, 0, 0, bone_moving.direction, bone_moving.image_angle);
	bone_instances[random_number].change_scale(1, 0.1);
	audio_play_sound_plugging(snd_spare_up);
}

var period = 58 - (_power) * 2;
var repeats = 6 + _power * 3;

time_source_update_shot = time_source_create(time_source_game, 1/3, time_source_units_seconds, function() {
	update_shot();
});

time_source_update_start = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
	time_source_start(time_source_update_shot);
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});
