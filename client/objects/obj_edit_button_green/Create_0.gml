edit_attack_number = 0;
edit_attack_number_max = 7;
is_can_input = true;

edited_objects_number = 0;

edit_button = UIImageButton(spr_edit_button_green, function() {
	if (!is_can_input || fight_get_initiative() != 0) return;
	press();
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
	with (attack_creator_green) event_user(5);
	
	is_can_input = false;
	time_source_start(cooldown);
	audio_play_sound_plugging(snd_selection);
}