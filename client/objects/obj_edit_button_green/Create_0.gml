edit_attack_number = 0;
edit_attack_number_max = 2;
is_can_input = true;

edited_objects_number = 0;

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
	if (edit_attack_number == 0) {
		edit_attack_number = choose(1, 2);
		edit_objects();
		exit;
	}
	if (edit_attack_number == 1) {
		edit_attack_number = choose(0, 2);
		edit_objects();
		exit;
	}
	if (edit_attack_number == 2) {
		edit_attack_number = choose(0, 1);
		edit_objects();
		exit;
	}
	is_can_input = false;
	time_source_start(cooldown);
	audio_play_sound_plugging(snd_selection);
}