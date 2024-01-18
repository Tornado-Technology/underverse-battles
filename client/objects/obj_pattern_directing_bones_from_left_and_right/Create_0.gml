// Arguments: spining_bone

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var side = irandom_range(0, 1);
	var bone_instance;
			
	if (side == 0) {
		bone_instance = create_spinning_bone(border_instance.x - border_instance.left - 10, soul_instance.y, spining_bone,
			3 + _power * 0.1, 1, 0, 0, 5, fight_network_mode);
	} else {
		bone_instance = create_spinning_bone(border_instance.x - border_instance.left - 10, soul_instance.y, spining_bone,
			3 + _power * 0.1, 1, 180, 0, 5, fight_network_mode);
	}
}

var period = 33 - 2 * _power;
var repeats = 10 + _power * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});