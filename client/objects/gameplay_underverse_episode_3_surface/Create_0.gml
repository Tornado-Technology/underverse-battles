event_inherited();

episode = "Underverse_Episode3.";

// Fight
fight = obj_fight_underverse_episode2;

// Characters
frisk = obj_character_frisk;
sans = obj_character_sans;
papyrus = obj_npc_papyrus_episode_3;
undyne = obj_npc_undyne;
alphys = obj_npc_alphys;
toriel = obj_npc_toriel;
asgore = obj_npc_asgore;

// Stuff
steak = obj_steak;

// Soul
soul_sans_half = noone;

// Data
is_first_appearance = true;
nice_cream_saled = false;
nice_cream_seller_spook = false;
search_event_is_started = false;
lickers_found = [false, false, false];
mtt_is_late_became_known = false;
frisk_was_in_ketchup_shop = false;
ketchup_joke_was_told = false;

// Backgrounds
var layer_background_current = layer_get_id("Background");
var background_id = layer_background_get_id(layer_background_current);

// Methods
restart = function() {
	cutscene_create(cutscenes[0]);
}

check_ketchup_in_inventory = function() {
	return obj_inventory.has("Ketchup") || obj_inventory.has("KetchupLimited");
}

create_final_volleyball_cutscene = function() {
	cutscene_create(cutscenes[1]);
}

// Cutscenes
cutscenes = [
	[	// Picnic begins (Index: 0)
		//[cutscene_execute, function() {
		//	frisk.control(true);
		//	sans.follow(frisk);
		//}],
		[cutscene_object_set_sprtie, frisk, spr_frisk_with_plate],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting_eating],
		[cutscene_wait, 3],
		[cutscene_dialog, episode + "Dialog17", dir.down],
		[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_spilling_ketchup],
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, papyrus, spr_papyrus_picnic_sitting_shocked],
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_sitting_laughing],
		[cutscene_dialog, episode + "Dialog18", dir.down],
		[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_sitting_looking_left],
		[cutscene_object_set_sprtie, papyrus, spr_papyrus_picnic_sitting_eating],
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, toriel, spr_toriel_picnic_sitting_eating_looking_down],
		[cutscene_dialog_async, episode + "Dialog19", dir.down],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting_eating_looking_up],
		[cutscene_wait_by_dialog, 2],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting_eating_steak_up],
		[cutscene_wait_dialog_end],
		[cutscene_camera_change_zoom, 2, 0.2, 543, 2892],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting_eating_joking],
		[audio_play_sound_once, snd_ba_dum_tss],
		[cutscene_wait, 1],
		[cutscene_camera_change_zoom, 1, 0.2, 543, 2892],
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, toriel, spr_toriel_picnic_sitting_laughing],
		[cutscene_dialog_async, episode + "Dialog20", dir.down],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting_eating],
		[cutscene_wait_by_dialog, 2],
		[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_sitting_looking_left],
		[cutscene_object_set_sprtie, toriel, spr_toriel_picnic_sitting_eating],
		[cutscene_wait_by_dialog, 3],
		[cutscene_object_set_sprtie, papyrus, spr_papyrus_picnic_sitting_shocked],
		[cutscene_wait_by_dialog, 6],
		[cutscene_object_set_sprtie, papyrus, spr_papyrus_picnic_sitting_eating],
		[cutscene_wait_by_dialog, 11],
		[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_spilled_ketchup_glad],
		[cutscene_wait_dialog_end],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting_putting_steak],
		[cutscene_object_set_sprtie, frisk, spr_frisk_walking_right_with_plate],
		[cutscene_object_move_to, frisk, 444, 2887, 2],
		[cutscene_object_set_sprtie, frisk, spr_frisk_putting_plate],
		[cutscene_wait, 1.2],
		[cutscene_object_set_sprtie, frisk, spr_frisk_walking_down],
		[cutscene_character_move, frisk, 0, 50, 2],
		[cutscene_object_set_sprtie, frisk, spr_frisk_standing_down],
		[cutscene_wait, 0.2],
		[cutscene_execute, function() {
			instance_create_depth(sans.x + 4, sans.y, fight_depth.player, obj_steak);
		}],
		[cutscene_object_set_sprtie, sans, spr_sans_walking_left],
		[cutscene_object_move_to, sans, 480, 2936, 2],
		[cutscene_object_set_sprtie, sans, spr_sans_standing_left],
		[cutscene_wait, 0.5],
		[cutscene_dialog, episode + "Dialog21", dir.down],
		[cutscene_execute, function() {
			frisk.direction = dir.down;
			frisk.control(true);
			sans.follow(frisk);
		}],
	],
	[
		[cutscene_execute, function() {
			var vollayball_undyne = obj_volleyball_character_undyne;
			undyne = instance_create_depth(vollayball_undyne.x, vollayball_undyne.y, vollayball_undyne.depth, obj_npc_undyne, {
				sprite_index: spr_undyne_picnic_with_ball
			});
			instance_destroy(vollayball_undyne)
		}],
		[cutscene_execute, function() {
			audio_sound_gain(snd_a_happy_gathering, 0, 2000);
		}],
		[cutscene_wait, 0.5],
		[cutscene_dialog_async, episode + "Dialog25", dir.up],
		[cutscene_wait_by_dialog, 1],
		[cutscene_dialog_set_side, dir.down],
		[cutscene_wait_by_dialog, 2],
		[cutscene_dialog_set_side, dir.up],
		[cutscene_wait_by_dialog, 3],
		[cutscene_dialog_set_side, dir.down],
		[cutscene_wait_by_dialog, 4],
		[cutscene_dialog_set_side, dir.up],
		[cutscene_wait_dialog_end],
		[cutscene_execute, function() {
			audio_stop_sound(snd_a_happy_gathering);
			audio_play_soundtrack(snd_round_justice, false);
		}],
		[cutscene_wait, 2],
		[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_superpunch]
	]
];