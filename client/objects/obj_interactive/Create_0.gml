target_character = obj_character_frisk;
npc = obj_npc;
is_destroying = false;

index = 0;
dialog_instance = noone;
dialog_created = false;

gui_half_height = display_get_gui_height() / 2;

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

dialog_direction = function() {
	return (npc.y - npc.sprite_height - obj_camera.camera_position.y > gui_half_height ? dir.up : dir.down);
}

is_last_cutscene = function() {
	return (index >= array_length(cutscenes) - 1);
}