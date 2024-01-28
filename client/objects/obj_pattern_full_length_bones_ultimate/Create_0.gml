// Arguments: bone, sharp_bone

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
	
	update();
	update_sharp();
	time_source_start(time_source_update);
	time_source_start(time_source_update_sharp);
	time_source_start(time_source_update_stop);
}

update = function() {
	var bone_speed = 1.5;
	var bone_size = 8.3;
	var random_side = choose(dir.up, dir.down, dir.left, dir.right);
		
	if (random_side == dir.up) {
		create_bone(border_instance.x + border_instance.right, border_instance.y - border_instance.up - 4, bone, bone_speed, bone_size, 270, 90);
		create_bone(border_instance.x - border_instance.left - 4, border_instance.y + border_instance.down, bone, bone_speed, bone_size, 0, 0);
	}
	if (random_side == dir.down) {
		create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down + 4, bone, bone_speed, bone_size, 90, 90);
		create_bone(border_instance.x + border_instance.right + 4, border_instance.y + border_instance.down, bone, bone_speed, bone_size, 180, 0);
	}
	if (random_side == dir.left) {
		create_bone(border_instance.x - border_instance.left - 4, border_instance.y + border_instance.down, bone, bone_speed, bone_size, 0, 0);
		create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down + 4, bone, bone_speed, bone_size, 90, 90);
	}
	if (random_side == dir.right) {
		create_bone(border_instance.x + border_instance.right + 4, border_instance.y + border_instance.down, bone, bone_speed, bone_size, 180, 0);
		create_bone(border_instance.x + border_instance.right, border_instance.y - border_instance.up - 4, bone, bone_speed, bone_size, 270, 90);
	}
}
	
update_sharp = function() {
	var bone_speed = 2.2;
	var bone_size = 1;
	var rand_side = irandom_range(0, 3);
	var bone_x = border_instance.x - border_instance.left - 10;
	var bone_y = border_instance.y + border_instance.down + 10;
	if (rand_side == 1) {
		bone_x = border_instance.x + border_instance.right + 10;
		bone_y = border_instance.y - border_instance.up - 10;
	}
	if (rand_side == 2) {
		bone_x = border_instance.x + border_instance.right + 10;
		bone_y = border_instance.y + border_instance.down + 10;
	}
	if (rand_side == 3) {
		bone_x = border_instance.x - border_instance.left - 10;
		bone_y = border_instance.y - border_instance.up - 10;
	}
	var bone_direction = point_direction(bone_x, bone_y, soul_instance.x, soul_instance.y);
	create_bone(bone_x, bone_y, sharp_bone, bone_speed, bone_size, bone_direction, bone_direction - 90);
	audio_play_sound_plugging(snd_projectile);
}

var period = 100;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
period = 60;
time_source_update_sharp = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_sharp();
}, [], -1);
var final_time = 450;
time_source_update_stop = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
	time_source_stop(time_source_update);
	time_source_stop(time_source_update);
	time_source_start(time_source_update_destroy);
});
time_source_update_destroy = time_source_create(time_source_game, 1, time_source_units_seconds, function () {
	instance_destroy();
});