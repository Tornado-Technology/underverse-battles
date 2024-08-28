// Arguments: monster, bone, nightmare_side

speed_bone = round(2 + _power * 0.1);
i = 0;

callback = function() {
	var offset_x = 200;
	var offset_end_x = 30;
	var radius = 20;
	var player = fight_get_player(nightmare_side);
	
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);

	if (player.index != character_id.nightmare) {
		nightmare_side++;	
	}
	
	var position_x = !nightmare_side ? border_instance.x - border_instance.left - offset_x  : border_instance.x + border_instance.right + offset_x;
	var position_x_end = !nightmare_side ? border_instance.x - border_instance.left - offset_end_x : border_instance.x + border_instance.right + offset_end_x;
	instance_create_depth(position_x, border_instance.y - 30, fight_depth.bullet_outside_hight, monster, {
		speed_count: 3,
		radius: radius,
		position_opponent: nightmare_side,
		position_head_x: position_x_end,
		position_head_y: border_instance.y
	});
	
	update();
	update_bone();

	time_source_start(time_source_update);
	time_source_start(time_source_update_bone);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var offset = 10;
	var position_x = nightmare_side ? border_instance.x - border_instance.left - offset : border_instance.x + border_instance.right + offset;	
	var direction_bone = nightmare_side ? 0 : 180;
	
	if (i > 10) {
		i = 0;	
	}
	
	last_bone_top = create_bone(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up, bone, speed_bone, 1, 180, 180);
	last_bone_bottom = create_bone(border_instance.x + border_instance.right + 10, border_instance.y + border_instance.down, bone, speed_bone, 1, 180, 0);
	last_bone_top.spinning = false;
	last_bone_bottom.spinning = false;
	
	bone_instances_0[i] = last_bone_top;	
	bone_instances_1[i] = last_bone_bottom;
	i++;
}

update_bone = function() {
	var size_bone_main = border_instance._frame_right_height;
	var	size_bone;
	size_bone_main /= fight_random_float(30, 38);
	size_bone = size_bone_main / fight_random_float(2.2, 2.9);

	if (fight_random_integer(0, 1)) {
		last_bone_top.image_yscale = size_bone_main;
		last_bone_bottom.image_yscale = size_bone;
	} else {
		last_bone_top.image_yscale = size_bone;
		last_bone_bottom.image_yscale = size_bone_main;
	}
	
	bone_instances_0 = array_filter(bone_instances_0, function(bone) {
		return bone != last_bone_top;
	});
	bone_instances_1 = array_filter(bone_instances_1, function(bone) {
		return bone != last_bone_bottom;
	});
}

update_shot = function() {
	var i = fight_random_integer(0, array_length(bone_instances_0) - 1);

	if (fight_random_integer(0, 1)) {
		with (bone_instances_0[i]) {
			speed_const = 1.6;
			direction = dir.down;
		}
	} else  {
		with (bone_instances_1[i]) {
			speed_const = 1.6;
			direction = dir.up;
		}
	}
	
	audio_play_sound_plugging(snd_spare_up);
}

var period = 45 - (2 * _power);
var repeats = 17 + _power * 3;

time_source_update = time_source_create(time_source_game,  1 / round(speed_bone * 4.5), time_source_units_seconds, function() {
	update();
}, [], -1);

time_source_update_bone = time_source_create(time_source_game, (45 - _power) / 60, time_source_units_seconds, function() {
	update_bone();
	update_shot();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function() {
	instance_destroy();
});