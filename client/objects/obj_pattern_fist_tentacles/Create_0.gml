//Arguments: tentacles, custom_repeats (optional)

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		var position = rand_side_from(border_instance.x - border_instance.left - 10, border_instance.y - border_instance.up - 10, border_instance.x + border_instance.right + 10, border_instance.y + border_instance.down + 10);
	var s = 0;
	var speed_count =  3 + _power * 0.1;
	var t = instance_create_depth(border_instance.x + 90, border_instance.y, fight_depth.bullet_outside, fist, {
		image_angle: s,
		speed_count: speed_count
	 });
	t.change_scale(11, 0.01);
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function () {

	 
	 
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