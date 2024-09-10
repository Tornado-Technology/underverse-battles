/// Arguments: carousel

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	side_next_attack = {
		left: border_instance.left + 40,
		right: border_instance.right + 40
	}
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_start_transition_attack);
	time_source_start(time_source_update_destroy);
}

update = function() { 
	var i = 0;
	var offset = 60;
	repeat(4) {
		var carousel_instance = instance_create_depth(border_instance.x, border_instance.y - border_instance.up + offset * i, 0, carousel, {
			step: 0.05,
			speed_count: 1.5 + _power * 0.1 
		});
		
		carousel_instance.sprite_frame = fight_random_integer(0, 2);	
		i++;
	}
}

transition_attack = function() {
	var step = 0.8;
	var side_left = approach(border_instance.left, side_next_attack.left, step * dtime);
	var side_right =  approach(border_instance.right, side_next_attack.right, step * dtime);
	
	battle_border_set_size(border_instance.up, border_instance.down, side_left, side_right);
}

var period = 40 - _power * 2;
var repeats = 10 + _power * 3;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
}, [], 4);

time_source_transition_attack = time_source_create(time_source_game, 1 / 60, time_source_units_seconds, function() {
	transition_attack();
}, [], -1);

time_source_start_transition_attack = time_source_create(time_source_game, (period * repeats / 65), time_source_units_seconds, function() {
	obj_carousel_jevil.destroy = true;
	time_source_start(time_source_transition_attack);
});

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function() {
	instance_destroy();
});