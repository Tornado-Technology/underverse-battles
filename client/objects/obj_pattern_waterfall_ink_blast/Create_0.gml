// Arguments: 

callback = function () {
	var soul_random_position = new Vector2(fight_random_choose(border_instance.x - border_instance.left/2, border_instance.x + border_instance.right/2), fight_random_choose(border_instance.y - border_instance.up/2, border_instance.y + border_instance.down/2));
	soul_instance = create_soul(soul_random_position.x, soul_random_position.y, battle_soul_type.red);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var brush_side = fight_random_integer(0, 2);
	var i = fight_random_integer(0, array_length(waterfall) - 1);
	var coord_x; 
	var	coord_y = border_instance.y - border_instance.up;
	
	if (brush_side == 0) {
		coord_x = border_instance.x - border_instance.left + 10;
	} else if (brush_side == 1) {
		coord_x = border_instance.x + border_instance.right - 10;
	} else if (brush_side == 2) {
		coord_x = border_instance.x;
	};
	
	instance_create_depth(coord_x, coord_y, fight_depth.bullet_outside_hight, waterfall[i]);
}


var period = 80;
var repeats = 5;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});