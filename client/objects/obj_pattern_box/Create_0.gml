/// Arguments: box, sprite_box

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
	
};

update = function () { 
		var border = border_instance;
		var random_position = new Vector2(0, -10);
	if (fight_random_integer(0, 1)) {
		var offset_x = 25;
		var start_x = border.x - border.right - 10;
		random_position.x = start_x - fight_random_integer(offset_x, offset_x * 2);
	} else {
		var offset_x = 25;
		var start_x = border.x + border.left + 10;
		random_position.x = start_x + fight_random_integer(offset_x, offset_x * 2);
	}; 
	
	var box_instance = instance_create_depth(random_position.x, random_position.y, 0, box, {
		sprite_index: sprite_box
	});
	
	box_instance.speed_count = 3 + _power * 0.1;
	box_instance.target = new Vector2(box.x, border.y + border.down + fight_random_integer(-125, 50));
	box_instance.step = fight_random_float(2, 2.7);

};

var period = 35 - (_power * 2);
var repeats = 10 + (_power * 3);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, (period / 60), time_source_units_seconds, function () {
	update();
}, [],  -1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / (60 + 1.5), time_source_units_seconds, function () {
	instance_destroy();
});