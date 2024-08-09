speed_bone = 2 + _power * 0.1;

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);

	nightmare_side = 0;
	
	var player = fight_get_player(nightmare_side);
	
	if (player.index != character_id.nightmare) {
		nightmare_side++;	
	}

	var position_x = !nightmare_side ? border_instance.x - border_instance.left - 200  : border_instance.x + border_instance.right + 200;
	var position_x_end = !nightmare_side ? border_instance.x - border_instance.left - 30  : border_instance.x + border_instance.right + 30;
	instance_create_depth(position_x, border_instance.y - 30, fight_depth.bullet_outside_hight, monster, {
		speed_count: 3 + _power * 0.1,
		radius: 20,
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
	var position_x = nightmare_side ? border_instance.x - border_instance.left - 10  : border_instance.x + border_instance.right + 10;	
	var direction_bone = nightmare_side ? 0 : 180;
	
	bone_up = create_bone(position_x, border_instance.y - border_instance.up, bone, speed_bone, 1, direction_bone, 180);
	bone_down = create_bone(position_x, border_instance.y + border_instance.down, bone, speed_bone, 1, direction_bone, 0);
	
	bone_up.spinning = false;
	bone_down.spinning =  false
}

update_bone = function () {
	var size_bone_main = border_instance._frame_right_height;
	var	bone_main_y = border_instance.y - border_instance.up;
	var	bone_main_x = nightmare_side ? border_instance.x - border_instance.left - 10 : border_instance.x + border_instance.right + 10;	
	var	size_bone;
	var bone_instance_0;
	var bone_instance_1;

	size_bone_main /= random_range(30, 38);
	size_bone = size_bone_main / random_range(2.2, 2.9);

	var direction_bone = point_direction(bone_main_x, bone_main_y, border_instance.x, bone_main_y);
		
	if (fight_random_integer(0, 1)) {	
		bone_instance_0 = create_bone(bone_up.x, bone_up.y, bone, speed_bone, size_bone_main, direction_bone, 180);
		bone_instance_1 = create_bone(bone_down.x, bone_down.y, bone, speed_bone, size_bone, direction_bone, 0);
	} else {
		bone_instance_0 = create_bone(bone_up.x, bone_up.y, bone, speed_bone, size_bone, direction_bone, 180);
		bone_instance_1 = create_bone(bone_down.x, bone_down.y, bone, speed_bone, size_bone_main, direction_bone, 0);
	}
	
	instance_destroy(bone_up);
	instance_destroy(bone_down);
	
	bone_instance_0.spinning = false;
	bone_instance_1.spinning = false;	
}


var period = 45 - (2 * _power);
var repeats = 17 + _power * 3;


time_source_update = time_source_create(time_source_game,  1 / (11.5), time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_bone = time_source_create(time_source_game,  (45 - _power) / 60, time_source_units_seconds, function () {
	update_bone();	
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});