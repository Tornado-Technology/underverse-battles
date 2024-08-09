//Arguments: slime, platform, fist_capture, fist

callback = function () {
	var time = 0.02;
	soul_instance = create_soul(border_instance.x, border_instance.y - border_instance.up + 15, battle_soul_type.red);
		
	slime_yscale = 20;
	
	slime_instnace = instance_create_depth(border_instance.x, border_instance.y + border_instance.down, fight_depth.bullet_outside, slime, {
		image_xscale: 15,
	});
	
	slime_instnace.back_const = 15;
	slime_instnace.change_scale(slime_yscale, time);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {
	slime_instnace.scale_const = fight_random_integer(10, 17);
	var random_hand = fight_random_choose(fist, fist_capture);
	var angle = 90;
	var speed_count = 2 + _power * 0.1;
	var position_x = fight_random_integer(border_instance.x - border_instance.left + 12, border_instance.x + border_instance.right - 12);
	var fist_instance = instance_create_depth(position_x, border_instance.y + border_instance.down + 20, fight_depth.bullet_outside, random_hand, {
		image_angle: angle,
		speed_count: speed_count
	});
	
	if (random_hand == fist) {
		fist_instance.step = 0.2;
	}
	
	audio_play_sound_plugging(snd_wing);
 };
 
var period = 34 - (_power * 2);
var repeats = 8 + (_power * 2);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, (period) / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});