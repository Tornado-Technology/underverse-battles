// Arguments: bone, thread

callback = function () {
	soul_instance = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);

	update_bone();
	time_source_start(time_source_update_bone);
	time_source_start(time_source_update_thread);
	time_source_start(time_source_update_destroy);
}

update_bone = function() {
	var coord = rand_side_from(border_instance.x - border_instance.left - 20, border_instance.y - border_instance.up - 20, border_instance.x + border_instance.right + 20, border_instance.y + border_instance.down + 20);
	var spear_direction = point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y);
	var bone_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, bone);
	bone_instance.speed_const = 2 + _power * 0.2;
	bone_instance.direction = spear_direction;
	bone_instance.image_angle = spear_direction;
}
	
update_thread = function() {
	var coord = [];
	coord = rand_side_from(-1, -1, room_width + 1, room_height + 1);
	
	var thread_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, thread);
	thread_instance.x_dir = soul_instance.x;
	thread_instance.y_dir = soul_instance.y;
	thread_instance.scale_speed = 3.2 + _power * 0.2;
	
	audio_play_sound_plugging(snd_string);
}

var period = 45;
time_source_update_bone = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_bone();
}, [], -1);
var period = 38 - _power * 3;
time_source_update_thread = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_thread();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (300 + _power * 20) / 60, time_source_units_seconds, function () {
	instance_destroy();
});