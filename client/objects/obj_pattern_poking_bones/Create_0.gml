// Arguments: bone

index = 0;

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var coord = [];
	coord = rand_side_from(border_instance.x - border_instance.left - 40, border_instance.y - border_instance.up - 40, border_instance.x + border_instance.right + 40, border_instance.y + border_instance.down + 40);
	bone_instances[index] = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside, bone);
	bone_instances[index].direction = point_direction(bone_instances[index].x, bone_instances[index].y, border_instance.x, border_instance.y);
	bone_instances[index].image_angle = bone_instances[index].direction - 90;
	bone_instances[index].image_yscale = 3.2;
	bone_instances[index].speed_const = 1.3 + 0.1 * _power;
	bone_instances[index].set_move_back();
	++index;
	audio_play_sound_plugging(snd_projectile);
}

var period = 20 - 2 * _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

var final_time = 300 + period * _power;
time_source_update_destroy = time_source_create(time_source_game, final_time / 60, time_source_units_seconds, function () {
	instance_destroy();
});