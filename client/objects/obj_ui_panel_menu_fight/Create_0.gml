// Inherit the parent event
event_inherited();

global.pause_game = true;

title = translate_get("Pause.Title");
text_return = translate_get("Pause.Return");
text_report = translate_get("Pause.ReportPlayer");
text_giveup = translate_get("Pause.GiveUp");
text_exit = translate_get("Pause.ExitToMenu");

gameplay_exists = global.gameplay_instance != noone;
fight_exists = global.fight_instance != noone;

add_button(text_return, function() {
	if (to_close) exit;
	
	if (!fight_network_mode && fight_exists) {
		timer_resume();
	}
	close();
});

if (fight_exists) {
	add_button(text_giveup, function() {
		if (to_close) exit;
		
		var damage = fight_get_player_hp(0);
		if (damage > 0) {
			fight_set_player_hp(0, 0);
			fight_draw_damage_number(0, damage);
		
			if (fight_network_mode) {
				send_fight_kill();			
			}
		}
		close();
	});
}

if (!fight_network_mode) {
	add_button(text_exit, function() {
		if (to_close) exit;
		
		if (gameplay_exists) {
			instance_destroy(global.gameplay_instance);
		}
		camera_resize();
		instance_destroy();
		room_goto(room_menu);
	});
	
	if (fight_exists) {
		timer_pause();
	}
}
