event_inherited();

soul_instance = noone;
border_instance = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);

time_source_start(time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	callback();
}));

create_pattern = function(object) {
	var instance = instance_create(object, {
		character: character,
		soul_instance: soul_instance,
	});
	
	return instance;
}

callback = function() {}