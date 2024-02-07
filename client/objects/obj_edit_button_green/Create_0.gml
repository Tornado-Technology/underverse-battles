edit_attack_number = 0;
edit_attack_number_max = 7;
is_can_input = true;

edited_objects_number = 0;

edit_button = UIImageButton(spr_edit_button_green, function() {
	if (!is_can_input || fight_get_initiative() != 0) return;
	press();
	send_to_server();
});

edit_objects = function() {
	var pattern_instance = obj_pattern_edit;
	
	var i = 0;
	repeat(array_length(pattern_instance.editing_object)) {
		var editable_instance = pattern_instance.editing_object[i];
		if (instance_exists(editable_instance)) {
			var editable_instance = pattern_instance.editing_object[i];
			destroy_battle_object_by_edit(editable_instance, c_green, editable_instance.edit_particle_count, editable_instance.edit_particle_distance);
		}
		i++;
	}
	array_clear(pattern_instance.editing_object);
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
	
	with (obj_pattern_edit) {
		var period = 7;
		if (edit_button != noone) {
			if (edit_button.edit_attack_number >= 6) period = 50;
		}
		
		time_source_destroy(time_source_update);
		time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
			update();
		}, [], -1);
		time_source_start(time_source_update);
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
