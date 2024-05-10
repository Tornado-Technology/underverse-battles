target_character = obj_character_frisk;
npc = obj_npc;
npc_is_speacking = false;
dialog_keys = [""];
is_destroying = false;

index = 0;
dialog_instance = noone;
dialog_created = false;

interact_callback = function() {
	if (npc_is_speacking) {
		npc.interact();
	}
}

finish_interact_callback = function() {
	if (npc_is_speacking) {
		npc.finish_interact();
	}
	target_character.set_controlled();
	dialog_created = false;
}

is_last_dialog = function() {
	return (index >= array_length(dialog_keys) - 1);
}

dialog_update = function(index, str) {
	dialog_keys[index] = str;
}