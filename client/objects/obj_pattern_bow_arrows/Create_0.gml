// Arguments bow, arrow

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);	
	time_source_start(time_source_update_destroy);
};

	
update = function () {
	if (instance_number(bow) != _power + 1) {
		var offset_x = fight_random_integer(70, 90);
		var offset_y = 20;
				
		var px1 = border_instance.x - border_instance.left - offset_x;
		var px2 = border_instance.x + border_instance.right + offset_x;
		var py1 = border_instance.y - border_instance.up - offset_y;
		var py2 = border_instance.y + border_instance.down + offset_y + 10;
		var coord_new	= rand_side_from(fight_random_choose(px1, px2), fight_random_choose(py1, py2), fight_random_choose(px2, px1), fight_random_choose (py1, py2));
			var bow_instance = instance_create_depth(coord_new[0] , coord_new[1], fight_depth.bullet_outside, bow, {
					target_time : 1 - _power * 0.1,
					shot_time : 0.7 - _power * 0.1 ,
					destroy_time : 0.5 - _power * 0.1,
					_power : _power,
					target : soul_instance,
					arrows : arrows,
					border_instance : border_instance
					});					
				
			};
	
};

var period = 33 + _power * 2;
var repeats = 20 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60 , time_source_units_seconds, function () {
update();	
}, [], repeats - 1);


time_source_update_destroy = time_source_create(time_source_game,  period * (repeats + 1) / 60, time_source_units_seconds, function () {
	if (instance_exists(bow)) {
		instance_destroy(bow);	
	}
instance_destroy();	
});	
	