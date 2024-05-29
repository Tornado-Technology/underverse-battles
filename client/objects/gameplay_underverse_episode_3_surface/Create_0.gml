event_inherited();

episode = "Underverse_Episode3.";

room_list = [room_underverse_episode_3_surface, room_underverse_episode_3_ketchup_shop, room_underverse_episode_3_muffet_bakery];
set_rooms_persistant(room_list, true);

// Fight
fight = obj_fight_underverse_episode2;

// Characters
frisk = obj_character_frisk;
sans = obj_character_sans;
papyrus = obj_npc_papyrus;
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
search_event_is_started = false;
mtt_is_late_became_known = false;

// Backgrounds
var layer_background_current = layer_get_id("Background");
var background_id = layer_background_get_id(layer_background_current);

// Methods
restart = function() {
	cutscene_create(cutscenes[0]);
}

cutscene_after_death = function () {
	effect_blackout_start(c_black, false, fight_depth.ui);
	
	instance_destroy(obj_cutscene);
	instance_destroy(ink_sans);
	instance_destroy(cross);
	instance_destroy(error_sans);
	instance_destroy_array(string_cross);
	instance_create(obj_soul_destroyed);
	time_source_start(time_source_restart);
}

// Cutscenes
cutscenes = [
	[	// Picnic begins (Index: 0)
		[cutscene_execute, function() {
			frisk.control(true);
			sans.follow(frisk);
		}],
		[cutscene_execute, function() {
			frisk.sprite_index = spr_frisk_with_plate;
			sans.sprite_index = spr_sans_sitting_eating;
			papyrus.sprite_index = spr_papyrus_picnic_sitting_eating;
			undyne.sprite_index = spr_undyne_picnic_eating_closed_eyes;
			alphys.sprite_index = spr_alphys_picnic_sitting_eating;
			toriel.sprite_index = spr_toriel_picnic_sitting_eating;
			asgore.sprite_index = spr_asgore_picnic_cooking;
		}],
		//[cutscene_wait, 3],
		//[cutscene_dialog, episode + "Dialog17", dir.down],
		//[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_spilling_ketchup],
		//[cutscene_wait, 1],
		//[cutscene_object_set_sprtie, papyrus, spr_papyrus_picnic_sitting_shocked],
		//[cutscene_wait, 1],
		//[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_sitting_laughing],
		//[cutscene_dialog, episode + "Dialog18", dir.down],
		//[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_sitting_looking_left],
		//[cutscene_object_set_sprtie, papyrus, spr_papyrus_picnic_sitting_eating],
		//[cutscene_wait, 1],
		//[cutscene_object_set_sprtie, toriel, spr_toriel_picnic_sitting_eating_looking_down],
		//[cutscene_dialog_async, episode + "Dialog19", dir.down],
		//[cutscene_wait_by_dialog, 1],
		//[cutscene_object_set_sprtie, sans, spr_sans_sitting_eating_looking_up],
		//[cutscene_wait_by_dialog, 2],
		//[cutscene_object_set_sprtie, sans, spr_sans_sitting_eating_steak_up],
		//[cutscene_wait_dialog_end],
		//[cutscene_camera_change_zoom, 2, 0.2, 543, 2892],
		//[cutscene_object_set_sprtie, sans, spr_sans_sitting_eating_joking],
		//[audio_play_sound_once, snd_ba_dum_tss],
		//[cutscene_wait, 1],
		//[cutscene_camera_change_zoom, 1, 0.2, 543, 2892],
		//[cutscene_wait, 1],
		//[cutscene_object_set_sprtie, toriel, spr_toriel_picnic_sitting_laughing],
		//[cutscene_dialog_async, episode + "Dialog20", dir.down],
		//[cutscene_wait_by_dialog, 1],
		//[cutscene_object_set_sprtie, sans, spr_sans_sitting_eating],
		//[cutscene_wait_by_dialog, 2],
		//[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_sitting_looking_left],
		//[cutscene_object_set_sprtie, toriel, spr_toriel_picnic_sitting_eating],
		//[cutscene_wait_by_dialog, 3],
		//[cutscene_object_set_sprtie, papyrus, spr_papyrus_picnic_sitting_shocked],
		//[cutscene_wait_by_dialog, 6],
		//[cutscene_object_set_sprtie, papyrus, spr_papyrus_picnic_sitting_eating],
		//[cutscene_wait_by_dialog, 11],
		//[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_spilled_ketchup_glad],
		//[cutscene_wait_dialog_end],
		//[cutscene_object_set_sprtie, sans, spr_sans_sitting_putting_steak],
		//[cutscene_wait, 1.2],
		//[cutscene_execute, function() {
		//	instance_create_depth(sans.x + 4, sans.y, fight_depth.player, obj_steak);
		//	sans.follow(frisk);
		//}],
		//[cutscene_wait, 1.4],
		//[cutscene_dialog, episode + "Dialog21", dir.down],
		//[cutscene_execute, function() {
		//	frisk.control(true);
		//}],
	]
];