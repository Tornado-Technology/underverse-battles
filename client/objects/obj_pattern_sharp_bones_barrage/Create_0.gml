// Arguments: sharp_bone

bone_count = 0;
bone_instances = [];

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.orange);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_stop);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var indent_x = 100;
	var interval_x = 4;
	var bone_x = irandom_range(border_instance.x - border_instance.left - indent_x, border_instance.x + border_instance.right - interval_x);
	var bone_speed = 2.6 + _power * 0.2;
	bone_instances[bone_count] = create_bone(bone_x, border_instance.y - border_instance.up - 20, sharp_bone,
	bone_speed, 1.5, -60, 210);
	bone_count++;
	audio_play_sound_plugging(snd_projectile);
}

var period = 16 - 3 * _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function (pow) {
	update();
}, [], -1);
var final_time = 240 + 60 * _power;
time_source_update_stop = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
	time_source_stop(time_source_update_0_2);
});
time_source_update_destroy = time_source_create(time_source_game, final_time / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});