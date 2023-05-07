on_into_story_mode.invoke("Tutorial");

scenario = 0;
fight_position_event = false;
scene_position_event = false;
start_pos_is_saving = false;
have_position = false;

delay_working = false;
_delay = 0

dlg = noone; //Объект диалога
episode = "Underverse_Episode1.";

// Time sources
time_source_restart = time_source_create(time_source_game, 5, time_source_units_seconds, function () {
	room_restart();
});

// Methods
cutscene_after_death = function () {
	effect_blackout_start(c_black, false, fight_depth.ui_hight);
	
	instance_destroy(obj_cutscene);
	instance_destroy(ink_sans);
	instance_destroy(cross);
	instance_destroy(error_sans);
	instance_destroy_array(string_cross);
	instance_create(obj_soul_destroyed);
	time_source_start(time_source_restart);
}

enable_mobile_ui = function() {
	if (is_mobile || mobile_mode) {
		global.__ui_controls_instance.enable = true;
		global.__ui_virtual_buttons_instance.is_enable = true;
	}
}

disable_mobile_ui = function() {
	if (is_mobile || mobile_mode) {
		global.__ui_controls_instance.enable = false;
		global.__ui_virtual_buttons_instance.is_enable = false;
	}
}