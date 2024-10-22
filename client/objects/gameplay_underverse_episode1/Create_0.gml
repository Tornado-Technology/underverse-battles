global.gameplay_instance = self;
fight_network_mode = false;

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

// Methods
cutscene_after_death = function () {
	instance_destroy(obj_ui_panel_menu_fight);
	
	scenario = -1;
	instance_destroy(dlg);
	instance_destroy(player_);
	instance_destroy(ink_sans_);
	instance_destroy(xchara_);
	create_destroying_soul(room_restart);
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