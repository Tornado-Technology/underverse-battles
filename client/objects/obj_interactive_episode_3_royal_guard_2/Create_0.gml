event_inherited();

npc = obj_npc_royal_guard_2;
npc_is_speacking = true;
dialog_keys = ["Underverse_Episode3.RoyalGuard2_1", "Underverse_Episode3.RoyalGuard2_2"];

cutscenes = [
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.RoyalGuard2_1", dialog_direction],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	],
	[
		[cutscene_execute, function() { npc.speak() }],
		[cutscene_dialog, "Underverse_Episode3.RoyalGuard2_2", dialog_direction],
		[cutscene_execute, function() {
			npc.stop_speaking();
			target_character.set_controlled();
		}]
	]
];