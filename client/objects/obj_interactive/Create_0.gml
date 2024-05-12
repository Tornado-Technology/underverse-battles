target_character = obj_character_frisk;
npc = obj_npc;
is_destroying = false;

index = 0;
dialog_instance = noone;
dialog_created = false;

gui_half_height = display_get_gui_height() / 2;
dialog_direction = target_character.y - target_character.sprite_height - obj_camera.camera_position.y > gui_half_height ? dir.up : dir.down;

cutscenes = [
	[
		[cutscene_execute, function () {
				finish_interact();
		}]
	]
];

interact_callback = function() {
	target_character.set_uncontrolled();
	
	cutscene_create(cutscenes[index]);
	
	if (!is_last_cutscene()) {
		index++;
	}
}

finish_interact = function() {
	target_character.set_controlled();
}

is_last_cutscene = function() {
	return (index >= array_length(cutscenes) - 1);
}