// Arguments: 

period = 60 - _power * 2;

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y + 20, battle_soul_type.red);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var brush_side = fight_random_integer(0, 2);
	var i = fight_random_integer(0, array_length(waterfall) - 1);
	
	var bone_x = fight_random_integer(border_instance.x - border_instance.left + 5, border_instance.x + border_instance.right - 5);
	var	bone_y = border_instance.y - border_instance.up;
	
	var waterfall_instance = instance_create_depth(bone_x, bone_y, fight_depth.bullet_outside_hight, waterfall[i]);
	waterfall_instance.speed_const = 0.25 + _power * 0.05;
}

var repeats = 5 + _power * 2;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function() {
	instance_destroy();
});