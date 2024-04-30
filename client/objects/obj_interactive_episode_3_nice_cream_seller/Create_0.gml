event_inherited();

is_saled = false;
second_dialog_key = function() {
	return is_saled ? "Underverse_Episode3.NiceCreamSeller_4" : "Underverse_Episode3.NiceCreamSeller_5";
}

dialog_keys = ["Underverse_Episode3.NiceCreamSeller_1", second_dialog_key()];

cutscene_set = function (index) {
	cutscene_create(cutscenes[index]);
}

cutscenes = [
	[
		[cutscene_choise, function (index) { cutscene_set(cutscenes[index + 1]); }]
	],
	[
		[cutscene_execute, function() {
			is_saled = true;
			npc.interact();
		}],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_2"],
		[cutscene_execute, function() {
			npc.finish_interact();
			target_character.set_controlled();
			dialog_created = false;
		}],
	],
	[
		[cutscene_execute, function() {
			npc.interact();
		}],
		[cutscene_dialog, "Underverse_Episode3.NiceCreamSeller_3"],
		[cutscene_execute, function() {
			npc.finish_interact();
			target_character.set_controlled();
			dialog_created = false;
		}],
	]
]

finish_interact_callback = function() {
	if (npc_is_speacking) {
		npc.finish_interact();
	}
	if (is_saled) exit;
	cutscene_create(cutscenes[0]);
}