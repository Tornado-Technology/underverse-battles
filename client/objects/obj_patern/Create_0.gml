callback = function() {};

create_projectile = function(_x, _y, projectile) {
	var instance = instance_create_depth(x, y, depth, projectile);
	instance.damage = character.damage;
	instance.soul_instance = soul_instance;
	
	return instance;
}

create_pattern = function(object) {
	var instance = instance_create(object, {
		character: character,
		soul_instance: soul_instance,
	});
	
	return instance;
}

time_source_call_callback = time_source_create(time_source_game, 1, time_source_units_frames, function() {
	callback();
	time_source_destroy(time_source_call_callback);
});

time_source_start(time_source_call_callback);
