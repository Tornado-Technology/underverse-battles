global.gameplay_instance = id;

on_into_story_mode.invoke("Tutorial");

restart_time = 5;
previous_room = room;
room_list = [];

// Methods
room_start_callback = function(callback = function() {}, new_room = room, _previous_room = previous_room) {
	if (previous_room == _previous_room && room == new_room) {
		callback();
		previous_room = room;
	}
}

cutscene_after_death = function() {
	room_instance_clear(room);
	effect_blackout_start(c_black, false, fight_depth.ui);
	
	instance_create(obj_soul_destroyed);
	time_source_start(time_source_restart);
}

restart = function() {}

set_rooms_persistant = function(room_array, value) {
	for (var i = 0; i < array_length(room_array); i++) {
		room_set_persistent(room_array[i], value);
	}
	room_persistent = value;
}

// Time sources
time_source_restart = time_source_create(time_source_game, restart_time, time_source_units_seconds, function() {
	restart();
});