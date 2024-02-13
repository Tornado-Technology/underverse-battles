//Arguments: tentacles, custom_repeats (optional)

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {
	var position = rand_side_from(border_instance.x - border_instance.left - 10, border_instance.y - border_instance.up - 10, border_instance.x + border_instance.right + 10, border_instance.y + border_instance.down + 10);
	var tentacles_instance = instance_create_depth(position[0], position[1], fight_depth.bullet_outside_hight, tentacles, {
		image_xscale: 0,
		image_angle: point_direction(position[0], position[1], border_instance.x, border_instance.y)
	 });
	 tentacles_instance.change_scale(1.6, 0.05);
 };
 
var period = 33 - 2 * _power;
var repeats = 5 + _power * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1.5, time_source_units_seconds, function () {
	instance_destroy();
});