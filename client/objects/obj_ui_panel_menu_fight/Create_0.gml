// Inherit the parent event
event_inherited();
title = translate_get("Pause.Title");
text_return = translate_get("Pause.Return");
text_report = translate_get("Pause.ReportPlayer");
text_giveup = translate_get("Pause.GiveUp");
text_exit = translate_get("Pause.ExitToMenu");

fight_exists = global.fight_instance != noone;

add_button(text_return, function() {
	if (!fight_network_mode && fight_exists) {
		timer_resume();
	}
	close();
});

if (fight_exists) {
	add_button(text_giveup, function() {
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
		room_goto(room_menu);
	});
	
	if (fight_exists) {
		timer_pause();
	}
}

fight_input_pause(true);
