edit_attack_number = 0;
edit_attack_number_max = 6;
is_can_input = true;

edited_objects_number = 0;

edit_button = UIImageButton(spr_edit_button_green, function() {
	if (!is_can_input || fight_get_initiative() != 0) return;
	press();
	send_to_server();
});

edit_objects = function() {
	var size = array_length(attack_creator_green.editing_object);
	var i = 1;
	repeat (size) {
		if (instance_exists(attack_creator_green.editing_object[size - i])) {
			attack_creator_green.editing_object[size - i].edit();
		}
		array_pop(attack_creator_green.editing_object);
		i++;
	}
}

cooldown = time_source_create(time_source_game, 1, time_source_units_seconds, function () {
	is_can_input = true;
});

press = function() {
	var edit_attack_number_current = edit_attack_number;
	while (edit_attack_number == edit_attack_number_current) {
		edit_attack_number = irandom_range(0, edit_attack_number_max);
	}
	edit_objects();
	
	with (attack_creator_green) {
		var period = 7;
		if (edit_button != noone) {
			if (edit_button.edit_attack_number >= 6) period = 50;
		}
		
		time_source_destroy(time_source_update_3_0);
		time_source_update_3_0 = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
			update_3_0();
		}, [], -1);
		time_source_start(time_source_update_3_0);
	}
	
	is_can_input = false;
	time_source_start(cooldown);
	audio_play_sound_plugging(snd_selection);
}

send_to_server = function () {
	if (fight_network_mode) {
		send_fight_extra_action();
	}
}
