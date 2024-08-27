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
	wings_instance.speed_const = 3 + _power * 0.1;
}

update_feathers = function () {
	var offset = 50;
	
	repeat(2) {
		var position_x = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
		var position_y = fight_random_choose(border_instance.y - border_instance.up - offset, border_instance.y + border_instance.down + offset);	
		var direction_feathers = position_y == border_instance.y - border_instance.up - offset ?  270 : 90;
			
		var feathers_instnace = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, feathers, {
			direction: direction_feathers,
			image_angle: direction_feathers
		});
		
		feathers_instnace.speed_const = 2 + _power * 0.1;
	}
	
}

var period = 40 - _power * 2;
var period_feathers = 35 - _power;
var repeats = 10 + _power * 2;

time_source_update = time_source_create(time_source_game, (period) / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_feathers = time_source_create(time_source_game, (period_feathers) / 60, time_source_units_seconds, function () {
	update_feathers();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});