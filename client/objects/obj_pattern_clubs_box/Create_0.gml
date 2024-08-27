/// Arguments: box

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
	
};

update = function () { 		
	var spwan_clubs = function () {	
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
			sprite_index:  sprite_clubs
		});
		box_instance.speed_count = 3 + _power * 0.1;
		box_instance.target = new Vector2(box_instance.x, border.y + border.down + fight_random_integer(-125, 50));
		box_instance.step = fight_random_float(2, 2.7);
	}
	
	var spwan_spades = function () {
		var position_finish;
		var random_position;
		var start_x;
		var finish_x;
		var box_instance;
		var offset = fight_random_integer(15, 40);
	
		var start_y = choose(border_instance.y - border_instance.up - offset, border_instance.y + border_instance.down + offset);
	
		if (fight_random_integer(0, 1)) {
			start_x = fight_random_integer(border_instance.x - border_instance.left - 150,  border_instance.x - border_instance.left - 70);
			finish_x = fight_random_integer(start_x + 30, start_x + 90);
		} else {
			start_x = fight_random_integer(border_instance.x + border_instance.right + 150,  border_instance.x + border_instance.right + 50);
			finish_x = fight_random_integer(start_x - 120, start_x - 200);
		};

		random_position = new Vector2(start_x, start_y);	
		position_finish = new Vector2(finish_x, start_y);
	
		box_instance = instance_create_depth(random_position.x, random_position.y, 0, box, {
				sprite_index:  sprite_spades
		});
		
		box_instance.speed_count = 3 + _power * 0.1;
		box_instance.target = position_finish;
		box_instance.step = fight_random_float(2, 2.7);
	}
	
	if(fight_random_integer(0, 1)) {
		spwan_clubs();	
	} else {
		spwan_spades();	
	};
	
};

var period = 55 - ( _power);
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