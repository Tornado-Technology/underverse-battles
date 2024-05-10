event_inherited();

dialog_keys = ["Underverse_Episode3.FicusLicker_1", "Underverse_Episode3.FicusLicker_2"];

finish_interact_callback = function() {
	if (npc_is_speacking) {
		npc.finish_interact();
	}
	target_character.set_controlled();
	dialog_created = false;
	
	gameplay_underverse_episode_3_part_2.search_event_is_started = true;
}
