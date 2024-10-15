edit_attack_number = 0;
edit_attack_number_max = 8;
is_can_input = true;

edited_objects_number = 0;

edit_button = new UIImageButton(0, spr_edit_button_green)
	.set_on_press(function() {
		if (!is_can_input || fight_get_initiative() != 0) return;
		network_check_press(get_random_attack_type());
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
	edit_attack_number = get_random_attack_type();
	edit_objects();
	
	obj_pattern_edit.change_time_source_update();
	
	is_can_input = false;
	time_source_start(cooldown);
	audio_play_sound_plugging(snd_selection);
}

network_check_press = function(attack_index) {
	if (fight_network_mode) {
		send_fight_extra_action(attack_index);
	}
	else {
		press(attack_index);
	}
}

get_random_attack_type = function() {
	edit_attack_number += irandom_range(1, edit_attack_number_max - 1);
	if (edit_attack_number >= edit_attack_number_max) {
		edit_attack_number -= edit_attack_number_max;
	}
	return edit_attack_number;
}
