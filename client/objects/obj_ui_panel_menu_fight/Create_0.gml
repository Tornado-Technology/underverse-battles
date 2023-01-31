// Inherit the parent event
event_inherited();
title = translate_get("Pause.Title");
text_return = translate_get("Pause.Return");
text_report = translate_get("Pause.ReportPlayer");
text_giveup = translate_get("Pause.GiveUp");
text_exit = translate_get("Pause.ExitToMenu");

add_button(text_return, function() {
	close();
});

add_button(text_giveup, function() {
	var damage = fight_get_enemy_hp(0);
	if (damage > 0) {
		fight_set_enemy_hp(0, 0);
		fight_update_death();
		fight_draw_damage_number(0, damage);
		
		if (fight_network_mode) {
			send_fight_kill();			
		}
		
		audio_play_sound_plugging(snd_soul_damage);
	}
	close();
});

if (!fight_network_mode) {
	add_button(text_exit, function() {
		room_goto(room_menu);
	});
	
	fight_timer_set_state(TIMER_STATE.DISABLED);
}

fight_set_player_input(false);
fight_ui_set_player_can_input_skip(false);
