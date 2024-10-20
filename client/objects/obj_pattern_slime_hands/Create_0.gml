//Arguments: slime, drop, fist_capture, fist

callback = function() {
	var time = 0.02;
	soul_instance = create_soul(border_instance.x, border_instance.y - border_instance.up + 15, battle_soul_type.red);
		
	slime_yscale = 20;
	
	slime_instnace = instance_create_depth(border_instance.x, border_instance.y + border_instance.down, fight_depth.bullet_outside_hight, slime, {
		image_xscale: 15
	});
	
	slime_instnace.back_const = 15;
	slime_instnace.change_scale(slime_yscale, time);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_drops);
	time_source_start(time_source_update_destroy);
}

update = function() {
	slime_instnace.scale_const = fight_random_integer(10, 17);
	var random_hand = fight_random_choose(fist, fist_capture);
	var angle = 90;
	var speed_count = 2 + _power * 0.2;
	var position_x = border_instance.x - border_instance.left + fight_random_integer(1, 12) * 12;
	var fist_instance = instance_create_depth(position_x, border_instance.y + border_instance.down + 20, fight_depth.bullet_outside, random_hand, {
		image_angle: angle,
		speed_count: speed_count
	});
	
	if (random_hand == fist) {
		fist_instance.step = 0.2;
	}
	
	audio_play_sound_plugging(snd_wing);
}

update_drops = function() {
	var drop_x = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	
	var instance_drop = instance_create_depth(drop_x, border_instance.y - border_instance.up, fight_depth.bullet, drop);
	instance_drop.set_fall(0.04, 0.04 + _power * 0.01);
}

var fist_period = 32 - (_power * 2);
var drop_period = 33 - 3 * _power;
var repeats = 9 + (_power * 2);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, fist_period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_drops = time_source_create(time_source_game, drop_period / 60, time_source_units_seconds, function () {
	update_drops();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (fist_period * repeats) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});