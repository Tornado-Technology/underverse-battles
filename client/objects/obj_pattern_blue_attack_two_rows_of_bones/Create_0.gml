// Arguments: bone, use_gravity_attack, custom_repeats (optional)

bone_instances = [];
bone_count = 4;

callback = function () {
	if (use_gravity_attack)
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.blue);
	else
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var side = choose(dir.up, dir.down);
	if (use_gravity_attack) {
		soul_instance.change_gravity_force(side);
	}
		
	bone_instances[0] = instance_create_depth(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up - 15, fight_depth.bullet_outside, bone, {
		image_angle: 180,
		direction: 180
	});
	bone_instances[1] = instance_create_depth(border_instance.x - border_instance.left - 10, border_instance.y + border_instance.down + 15, fight_depth.bullet_outside, bone, {
		image_angle: 0,
		direction: 0
	});
		
	if (use_gravity_attack) {
		var bone_scale = 1.9;
		var i = 0;
		repeat(array_length(bone_instances)) {
			bone_instances[i].image_yscale = bone_scale;
			bone_instances[i].speed_const = 1.1 + _power * 0.1;
			++i;
		}
	}
	else
	{
		var bone_scale = 4.6;
		var rand_side = irandom_range(0, 3);
		bone_instances[rand_side].image_yscale = bone_scale;
		bone_instances[rand_side].speed_const = 1.8 + _power * 0.1;
	}
	
	character_instance.change_sprite_hand_dir(side);
}

var period = 75 - _power * 5;
var repeats = 5 + _power

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
	
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	character_instance.stop_hand_wave();
	instance_destroy();
});