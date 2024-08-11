// Arguments: bone, drop, tentacle, slime

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y - border_instance.up + 20, battle_soul_type.red);
	
	slime_instance = instance_create_depth(border_instance.x - border_instance.left, border_instance.y + border_instance.down + 10, fight_depth.bullet_outside_hight, slime, {
		image_xscale: 20,
		image_yscale: 10
	});
	slime_instance.change_scale(10, 0.1);

	update_bone();
	time_source_start(time_source_update_bone);
	time_source_start(time_source_update_drops);
	time_source_start(time_source_update_destroy);
	
	if (_power > 0) {
		time_source_start(time_source_update_tentacles);
	}
}

update_tentacles = function() {
	var cood = [fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right), fight_random_integer(slime_instance.y - 50, slime_instance.y - 10)]
	var tentacles_instance = instance_create_depth(cood[0], cood[1], fight_depth.border, tentacle, {
		image_angle: 90,	
		image_xscale: 0
	});
	tentacles_instance.change_scale(1.5, 0.05);
}

update_bone = function() {
	var bone_x = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	
	create_bone(bone_x, border_instance.y + border_instance.down, bone, 3 + _power * 0.1, 1, 90, 0);
	
	audio_play_sound_plugging(snd_projectile);
}

update_drops = function() {
	var drop_x = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	
	var instance_drop = instance_create_depth(drop_x, border_instance.y - border_instance.up, fight_depth.bullet, drop);
	instance_drop.set_fall(0.04, 0.04 + _power * 0.01);
}

var bone_period = 39 - 3 * _power;
var drop_period = 33 - 3 * _power;
var repeats = 14 + _power * 3;
var period_tentacles = 40 - 2 * _power;

time_source_update_tentacles = time_source_create(time_source_game, period_tentacles / 60, time_source_units_seconds, function () {
	update_tentacles();	
});

time_source_update_bone = time_source_create(time_source_game, bone_period / 60, time_source_units_seconds, function () {
	update_bone();	
}, [], repeats - 1);

time_source_update_drops = time_source_create(time_source_game, drop_period / 60, time_source_units_seconds, function () {
	update_drops();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, bone_period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});