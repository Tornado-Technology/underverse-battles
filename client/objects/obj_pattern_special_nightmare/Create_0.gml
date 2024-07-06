// Arguments: bomb,  spike

	
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);

		

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);	
};



update = function () {
	var random_position = new Vector2(fight_random_integer(border_instance.x - border_instance.left + 2, border_instance.x + border_instance.right - 2), fight_random_integer(border_instance.y - border_instance.up + 2, border_instance.y + border_instance.down - 2));
	var zone_instance =	instance_create_depth(random_position.x, random_position.y, fight_depth.bullet_outside, obj_damage_zone_warning_nightmare, {
		nightmare_id: character_instance	
	});


	
}

 
var period = 25;
var repeats = 10 + (_power) * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period  / 60, time_source_units_seconds, function () {
	final_function();
});