on_into_story_mode.invoke("Tutorial");

episode = "Underverse_Episode3.";

// Fight
fight = obj_fight_underverse_episode2;

// Characters
frisk = obj_character_frisk;
sans = obj_character_sans;
papyrus = obj_character_papyrus;
undyne = obj_character_undyne;
alphys = obj_character_alphys;
toriel = obj_character_toriel;
asgore = obj_character_asgore;

// Stuff

// Soul
soul_sans_half = noone;

// Data
search_event_is_started = false;

// Backgrounds
var layer_background_current = layer_get_id("Background");
var background_id = layer_background_get_id(layer_background_current);

// Time sources
time_source_restart = time_source_create(time_source_game, 5, time_source_units_seconds, function() {
	cutscene_set(0);
});

// Methods
cutscene_set = function (index) {
	cutscene_create(cutscenes[index]);
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
		//[cutscene_execute, function() {
		//	frisk.control(2, true);
		//	sans.follow(2, frisk);
		//}],
		[audio_play_sound, snd_park, 2, true],
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
		[cutscene_execute, function() {
			sans.follow(2, frisk);
		}],
		[cutscene_wait, 1.5],
		[cutscene_dialog, episode + "Dialog21", dir.down],
		[cutscene_execute, function() {
			frisk.control(2, true);
		}],
	]
];