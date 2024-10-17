/// Arguments: feathers, wings
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	update_feathers();
	time_source_start(time_source_update);
	time_source_start(time_source_update_feathers);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var	coord = rand_side_from(border_instance.x - border_instance.left - 40, border_instance.y - border_instance.up - 40, border_instance.x + border_instance.right + 40, border_instance.y + border_instance.down + 40);
	var  wings_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, wings);

	wings_instance.speed_const = 3.7 + _power * 0.1;
}

update_feathers = function () {
	var offset = 60;
	
	repeat(2) {
		var direction_feathers = choose(dir.right, dir.left);
		var position_x = direction_feathers == dir.right ? border_instance.x - border_instance.left - offset : border_instance.x + border_instance.right + offset;
		var position_y = fight_random_integer(border_instance.y - border_instance.up + 15, border_instance.y + border_instance.down - 15);
			
		var feathers_instnace = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, feathers, {
			_target_angle: direction_feathers
		});
	
		feathers_instnace._speed = 3 + _power * 0.2;
	}
}

var period = 60 - _power * 2;
var period_feathers = 42 - _power * 2;
var repeats = 8 + _power * 2;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_feathers = time_source_create(time_source_game, period_feathers / 60, time_source_units_seconds, function () {
	update_feathers();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period_feathers * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});