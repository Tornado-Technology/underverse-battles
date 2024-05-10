event_inherited();

npc = obj_npc_nice_cream_seller;
npc_is_speacking = true;
dialog_keys = ["Underverse_Episode3.NiceCreamSeller_1", "Underverse_Episode3.NiceCreamSeller_4"];

is_saled = false;

cutscene_set = function (index) {
	cutscene_create(cutscenes[index]);
}

cutscenes = [
	[
		[cutscene_choise, "Underverse_Episode3.NiceCreamSeller_Choise", function (index) { cutscene_set(index + 1); }, dir.down]
	],
	[
		[cutscene_execute, function() {
			is_saled = true;
			npc.interact();
		}],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_2", dir.down],
		[cutscene_execute, function() {
			npc.finish_interact();
			target_character.set_controlled();
		}],
	],
	[
		[cutscene_execute, function() {
			npc.interact();
		}],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_3", dir.down],
		[cutscene_execute, function() {
			npc.finish_interact();
			target_character.set_controlled();
		}],
	]
]

finish_interact_callback = function() {
	if (npc_is_speacking) {
		npc.finish_interact();
	}
	dialog_created = false;
	
	if (is_saled) {
		target_character.set_controlled();
		dialog_update(1, "Underverse_Episode3.NiceCreamSeller_5");
	}
	else {
		cutscene_create(cutscenes[0]);
	}
}