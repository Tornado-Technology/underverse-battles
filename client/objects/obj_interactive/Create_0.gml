target_character = obj_character_frisk;
npc = obj_npc;
required_pressing = true;

index = 0;
dialog_instance = noone;
dialog_created = false;
dialog_direction = 0;
sides = [dir.up, dir.down, dir.left, dir.right];

gui_half_height = display_get_gui_height() / 2;

cutscenes = [
	[
		[cutscene_execute, function () {}]
	]
];

interact_callback = function() {
	target_character.set_uncontrolled();
	
	cutscene_create(cutscenes[index]);
	
	if (!is_last_cutscene()) {
		index++;
	}
}

is_last_cutscene = function() {
	return (index >= array_length(cutscenes) - 1);
}

direct_dialog = function() {
	dialog_direction = npc.y - npc.sprite_height - obj_camera.camera_position.y > gui_half_height ? dir.up : dir.down;
}