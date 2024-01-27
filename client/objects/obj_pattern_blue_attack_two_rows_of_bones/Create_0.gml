// Arguments: bone, use_gravity_attack, custom_repeats (optional)

bone_instances = [];
bone_count = 4;

callback = function () {
	if (use_gravity_attack)
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.blue, fight_network_mode);
	else
		soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var side = choose(dir.up, dir.down);
	if (use_gravity_attack) {
		soul_instance.change_gravity_force(side);
	}
	
	destroy_battle_object_array(bone_instances, fight_network_mode);
	
	if (use_gravity_attack) {
		var bone_scale = 1.9;
		var bone_speed = 1.1 + _power * 0.1;
		bone_instances[0] = create_bone(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up - 15, bone,
			bone_speed, bone_scale, 180, 180, fight_network_mode);
		bone_instances[1] = create_bone(border_instance.x - border_instance.left - 10, border_instance.y + border_instance.down + 15, bone,
			bone_speed, bone_scale, 0, 0, fight_network_mode);
	}
	else
	{
		var bone_scale = 4.6;
		var bone_speed = 1.8 + _power * 0.1;
		
		var bone_x = border_instance.x + border_instance.right + 10;
		var bone_y = border_instance.y - border_instance.up - 15;
		if (side == dir.down) {
			bone_x = border_instance.x - border_instance.left - 10;
			bone_y = border_instance.y + border_instance.down + 15;
		}
		
		bone_instances[0] = create_bone(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up - 15, bone,
			bone_speed, bone_scale, side, side, fight_network_mode);
	}
	
	character_instance.change_sprite_hand_dir(side);
}

var period = 75 - _power * 5;
var repeats = 5 + _power;

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