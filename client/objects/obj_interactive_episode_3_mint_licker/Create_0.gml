event_inherited();

npc = obj_npc_mint_licker;

cutscenes = [
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.MintLicker_1", dialog_direction],
		[cutscene_execute, function () {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.MintLicker_2", dialog_direction],
		[cutscene_execute, function () {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	]
];