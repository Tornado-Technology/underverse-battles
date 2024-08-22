speed_bone = round(2 + _power * 0.1);

callback = function () {
	nightmare_side = 0;
	var offset_x = 200;
	var offset_end_x = 30;
	var radius = 20;
	var player = fight_get_player(nightmare_side);
	
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);


	if (player.index != character_id.nightmare) {
		nightmare_side++;	
	};

	
	var position_x = !nightmare_side ? border_instance.x - border_instance.left - offset_x  : border_instance.x + border_instance.right + offset_x;
	var position_x_end = !nightmare_side ? border_instance.x - border_instance.left - offset_end_x : border_instance.x + border_instance.right + offset_end_x;
	instance_create_depth(position_x, border_instance.y - 30, fight_depth.bullet_outside_hight, monster, {
		speed_count: 3 + _power * 0.1,
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
	
	bone_up = create_bone(position_x, border_instance.y - border_instance.up, bone, speed_bone, 1, direction_bone, 180);
	bone_down = create_bone(position_x, border_instance.y + border_instance.down, bone, speed_bone, 1, direction_bone, 0);
	
	bone_up.spinning = false;
	bone_down.spinning = false;
}

update_bone = function () {
	var size_bone_main = border_instance._frame_right_height;
	var	size_bone;
	size_bone_main /= fight_random_float(30, 38);
	size_bone = size_bone_main /  fight_random_float(2.2, 2.9);


	if (fight_random_integer(0, 1)) {	
		bone_up.image_yscale = size_bone_main;
		bone_down.image_yscale = size_bone;
	} else {
		bone_up.image_yscale = size_bone;
		bone_down.image_yscale = size_bone_main;
	};
	
}


var period = 45 - (2 * _power);
var repeats = 17 + _power * 3;


time_source_update = time_source_create(time_source_game,  1 / round(speed_bone * 4.5), time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_bone = time_source_create(time_source_game,  (45 - _power) / 60, time_source_units_seconds, function () {
	update_bone();	
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});