// Arguments: bone, spike

callback = function () {
	soul_instance = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
	update_bone();
	time_source_start(time_source_update_spike);
	time_source_start(time_source_update_bone);
	time_source_start(time_source_update_destroy);
}

update_spike = function() {
	var coord = rand_side_from(border_instance.x - border_instance.left - 20, border_instance.y - border_instance.up - 20, border_instance.x + border_instance.right + 20, border_instance.y + border_instance.down + 20);
	var spike_direction = point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y);
	var spike_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, spike);
	spike_instance.speed_const = 2 + _power * 0.2;
	spike_instance.direction = spike_direction;
	spike_instance.image_angle = spike_direction;
	audio_play_sound_plugging(snd_projectile);
}
	
update_bone = function() {
	var coord = rand_side_from(border_instance.x - border_instance.left - 20, border_instance.y - border_instance.up - 20, border_instance.x + border_instance.right + 20, border_instance.y + border_instance.down + 20);
	var bone_direction = point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y);
	create_bone(coord[0], coord[1], bone, 2 + _power * 0.2, 1, bone_direction, bone_direction - 90);
	audio_play_sound_plugging(snd_projectile);
}

var period = 20;
time_source_update_spike = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_spike();
}, [], -1);
var period = 25;
time_source_update_bone = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_bone();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (320 + 20 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});