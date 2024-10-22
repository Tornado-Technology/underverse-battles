global.gameplay_instance = self;
fight_network_mode = false;

on_into_story_mode.invoke("Tutorial");

restart_time = 5;
previous_room = room;

// Methods
room_start_callback = function(_previous_room, new_room = room, callback = function() {}) {
	if (previous_room == _previous_room && room == new_room) {
		callback();
		previous_room = room;
	}
}

cutscene_after_death = function() {
	instance_destroy(obj_ui_panel_menu_fight);
	
	room_instance_clear(room);
	effect_fill(c_black, 1, false, fight_depth.ui);
	
	create_destroying_soul(restart);
}

restart = function() {}