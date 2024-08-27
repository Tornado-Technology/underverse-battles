/// Arguments: carousel, 

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
	
};

update = function () { 
	var i = 0;
	var offset = 60;
	repeat(4) {
		var carousel_instance = instance_create_depth(border_instance.x - border_instance.left - 20, border_instance.y - border_instance.up + offset * i, 0, carousel, {
			step: 0.07 + _power * 0.01,
			speed_count: 3 + (_power * 0.1) - 0.01 * i
		});
		
		carousel_instance.sprite_frame = fight_random_integer(0, 2);	
		carousel_instance.target_position_x = border_instance.x + border_instance.right + 50;
		carousel_instance.backwards_x = border_instance.x - border_instance.left - 50;
		i++;
	}
};

var period = 40 - (2 * _power);
var repeats = 10 + _power * 3;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [],  4);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 , time_source_units_seconds, function () {
	obj_carousel_jevil.destroy = true;
	instance_destroy();
});