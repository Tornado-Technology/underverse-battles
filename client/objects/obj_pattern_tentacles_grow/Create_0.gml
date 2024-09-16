// Arguments: bomb,  spike

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};
update = function () {
	var speed_const = 1 + _power * 0.1;
	var _dir = 90;
	var multiplication = 0;
	var offset_x = 180;
	var offset_y = 80;
	var scale_const = 0.7;
	var offset = 40;
	var stats_x = border_instance.x - border_instance.left - 20;
	var stats_y = fight_random_choose(border_instance.y - border_instance.up - offset,  border_instance.y + border_instance.down + offset);
	var moving_y = (stats_y == border_instance.y - border_instance.up - offset ? 2 : -2);
	repeat (2) {
		var bomb_instnace = instance_create_depth(stats_x + offset_x * multiplication, stats_y, fight_depth.bullet, bomb, {
			speed_const: speed_const,
			scale_const: scale_const
		});
		bomb_instnace.moving(moving_y, fight_random_integer(10, 60));
		multiplication ++;
	}
	

}

 
var period = 80 - (_power) * 2;
var repeats = 10 + ( _power);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60, time_source_units_seconds, function () {
	instance_destroy();
});