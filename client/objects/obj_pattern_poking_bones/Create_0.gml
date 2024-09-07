// Arguments: bone

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var position = rand_side_from(border_instance.x - border_instance.left - 50, border_instance.y - border_instance.up - 50, border_instance.x + border_instance.right + 50, border_instance.y + border_instance.down + 50);
	var bone_direcrion = point_direction(position[0], position[1], border_instance.x, border_instance.y);
	
	var bone_instance = instance_create_depth(position[0], position[1], fight_depth.bullet_outside, bone);
	bone_instance.direction = bone_direcrion;
	bone_instance.image_angle = bone_direcrion - 90;
	bone_instance.image_yscale = 3.2;
	bone_instance.speed_const = 1 + 0.1 * _power;
	bone_instance.set_move_back();
	
	audio_play_sound_plugging(snd_projectile);
}

var period = 20 - 2 * _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, 5 + _power * 0.5, time_source_units_seconds, function() {
	instance_destroy();
});