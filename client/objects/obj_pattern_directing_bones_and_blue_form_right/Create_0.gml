//Arguments: bone, bone_blue

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 10, battle_soul_type.blue);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var bone_instance;
	var rand_side = fight_random_choose(dir.left, dir.right);
	var bone_speed = 2 + _power * 0.2;
	
	var bone_object = fight_random_integer(1, 100) <= 25 ? bone_blue : bone; 
	
	var min_scale = 1;
	var max_scale = bone_object == bone ? 3 : 4;
	var bone_size = fight_random_float(min_scale, max_scale);
	var scale_time = _power == 0 ? fight_random_float(0.05, 0.08) :
		(_power == 1 ? fight_random_float(0.05, 0.09) :
		(_power == 2 ? fight_random_float(0.06, 0.09) :
		(_power == 3 ? fight_random_float(0.06, 0.1) :
		fight_random_float(0.07, 0.1))));
	
	if (rand_side == dir.right) {
		bone_instance = create_bone(border_instance.x + border_instance.right + 4, border_instance.y + border_instance.down + 5, bone_object, bone_speed, bone_size, 180, 0);
	} else {
		bone_instance = create_bone(border_instance.x - border_instance.left - 4, border_instance.y + border_instance.down + 5, bone_object, bone_speed, bone_size, 0, 0);
	}
	
	bone_instance.set_pulsating_scale(min_scale, max_scale, scale_time);
}

var period = 55 - (_power);
var repeats = 10 + (_power);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});