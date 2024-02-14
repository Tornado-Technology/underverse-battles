border_instance = noone;
pattern_instance = noone;

time_border_delay = 0.6;

on_border_created = function() {}

create_border = function(up, down, left, right) {
	border_instance = battle_border_create(up, down, left, right);
	time_source_start(time_source_border_delay);
}

finish_attack = function() {
	instance_destroy(id);
}

/// @param {Asset.GMObject} pattern
/// @param {Struct} var_struct
/// @param {Function} final_function
/// @return {Id.Instance}
create_pattern = function(pattern, var_struct = {}, final_function = finish_attack) {
	var_struct.character_instance = character_instance;
	var_struct.border_instance = border_instance;
	var_struct._power = _power;
	var_struct.final_function = final_function;
	
	return instance_create(pattern, var_struct);
}

/// @param {Asset.GMObject} pattern
/// @param {Real} custom_power
/// @param {Struct} var_struct
/// @param {Function} final_function
/// @return {Id.Instance}
create_pattern_custom_power = function(pattern, custom_power, var_struct = {}, final_function = finish_attack) {
	var_struct.character_instance = character_instance;
	var_struct.border_instance = border_instance;
	var_struct._power = custom_power;
	var_struct.final_function = final_function;
	
	return instance_create(pattern, var_struct);
}

time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function() {
	on_border_created();
});