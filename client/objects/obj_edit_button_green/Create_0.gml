edit_attack_number = 0;
edit_attack_number_max = 7;
is_can_input = true;

edited_objects_number = 0;

edit_button = UIImageButton(spr_edit_button_green, function() {
	if (!is_can_input || fight_get_initiative() != 0) return;
	press(irandom(edit_attack_number_max));
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

press = function(attack_index) {
	if (edit_attack_number == attack_index) {
		edit_attack_number = (attack_index + irandom_range(1, edit_attack_number_max)) % (edit_attack_number_max + 1);
	}
	else {
		edit_attack_number = attack_index;
	}
	edit_objects();
	
	obj_pattern_edit.change_time_source_update();
	
	is_can_input = false;
	time_source_start(cooldown);
	audio_play_sound_plugging(snd_selection);
}

send_to_server = function () {
	if (fight_network_mode) {
		send_fight_extra_action(edit_attack_number);
	}
}
