event_inherited();

npc = obj_npc_nice_cream_seller;

is_saled = false;

interact_callback = function() {
	target_character.set_uncontrolled();
	
	cutscene_create(cutscenes[index]);
	
	
}

cutscenes = [
	[
		[cutscene_execute, function() { npc.interact(); }],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_1", dialog_direction()],
		[cutscene_execute, function() { npc.finish_interact(); }],
		[cutscene_choise, "Underverse_Episode3.NiceCreamSeller_Choise", function (index) { cutscene_create(cutscenes[index + 1]); }, dir.down]
	],
	[
		[cutscene_execute, function() {
			is_saled = true;
			npc.interact();
		}],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_2", dialog_direction()],
		[cutscene_execute, function() {
			npc.finish_interact();
			target_character.set_controlled();
			index = 4;
		}],
	],
	[
		[cutscene_execute, function() {
			npc.interact();
		}],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_3", dialog_direction()],
		[cutscene_execute, function() {
			npc.finish_interact();
			target_character.set_controlled();
			index = 3;
		}],
	],
	[
		[cutscene_execute, function() {
			npc.interact();
		}],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_4", dialog_direction()],
		[cutscene_choise, "Underverse_Episode3.NiceCreamSeller_Choise", function (index) { cutscene_create(index + 1); }, dir.down]
	],
	[
		[cutscene_execute, function() {
			npc.interact();
		}],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_5", dialog_direction()],
		[cutscene_execute, function() {
			npc.finish_interact();
			target_character.set_controlled();
		}],
	]
]

finish_interact = function() {
	if (npc_is_speacking) {
		npc.finish_interact();
	}
	dialog_created = false;
	
	if (is_saled) {
		target_character.set_controlled();
	} else {
		cutscene_create(cutscenes[0]);
	}
}