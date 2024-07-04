event_inherited();

episode = "Underverse_Episode3.";

// Fight
fight = obj_fight_underverse_episode2;

// Characters
frisk = obj_character_frisk;
sans = obj_character_sans;
papyrus = obj_npc_papyrus_episode_3;
papyrus_character = obj_character_papyrus;
undyne = obj_character_undyne;
alphys = obj_npc_alphys;
toriel = obj_npc_toriel;
asgore = obj_npc_asgore;

// Stuff
steak = obj_steak;
net = obj_volleyball_net;
jacket = obj_jacket_sans;

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
		[cutscene_execute, function() {
			frisk.control(true);
			sans.follow(frisk);
		}],
		//[cutscene_object_set_sprtie, frisk, spr_frisk_with_plate],
		//[cutscene_object_set_sprtie, sans, spr_sans_sitting_eating],
		//[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_eating_closed_eyes],
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
		//[cutscene_object_set_sprtie, frisk, spr_frisk_walking_right_with_plate],
		//[cutscene_object_move_to, frisk, 444, 2887, 2],
		//[cutscene_object_set_sprtie, frisk, spr_frisk_putting_plate],
		//[cutscene_wait, 1.2],
		//[cutscene_object_set_sprtie, frisk, spr_frisk_walking_down],
		//[cutscene_character_move, frisk, 0, 50, 2],
		//[cutscene_object_set_sprtie, frisk, spr_frisk_standing_down],
		//[cutscene_wait, 0.2],
		//[cutscene_execute, function() {
		//	instance_create_depth(sans.x + 4, sans.y, fight_depth.player, obj_steak);
		//}],
		//[cutscene_object_set_sprtie, sans, spr_sans_walking_left],
		//[cutscene_object_move_to, sans, 480, 2936, 2],
		//[cutscene_object_set_sprtie, sans, spr_sans_standing_left],
		//[cutscene_wait, 0.5],
		//[cutscene_dialog, episode + "Dialog21", dir.down],
		//[cutscene_execute, function() {
		//	frisk.direction = dir.down;
		//	frisk.control(true);
		//	sans.follow(frisk);
		//}],
	],
	[
		[cutscene_execute, function() {
			var volleyball_characters = [obj_volleyball_character_alphys, obj_volleyball_character_asgore, obj_volleyball_character_frisk, obj_volleyball_character_sans, obj_volleyball_character_papyrus, obj_volleyball_character_undyne];
			array_foreach(volleyball_characters, function(character, index) {
				var characters = [obj_npc_alphys, obj_npc_asgore, obj_character_frisk, obj_character_sans, obj_character_papyrus, obj_character_undyne];
				var character_sprites = [spr_alphys_volleyball_standing, spr_asgore_picnic_standing_down, spr_frisk_standing_down, spr_sans_volleybro_standing_down, spr_papyrus_picnic_standing_down, spr_undyne_picnic_with_ball];
				instance_create_depth(character.x, character.y, character.depth, characters[index], {
					sprite_index: character_sprites[index]
				});
				instance_destroy(character);
			});
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
		[cutscene_wait, 0.5],
		[cutscene_object_set_sprtie, papyrus_character, spr_papyrus_volleyball_standing],
		[cutscene_object_set_sprtie, frisk, spr_frisk_volleyball_standing],
		[cutscene_wait, 1.5],
		[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_superpunch],
		[cutscene_wait, 6/8],
		[cutscene_execute, function() {
			ball = instance_create_depth(undyne.x - 5, undyne.y, fight_depth.player, obj_volleyball_ball, {
				is_holding: false,
				is_for_minigame: false
			});
			ball.height = 103;
			ball.punch_down(90, 5, 1);
			camera_set_overwrite_position(obj_camera.camera_position.x, sans.y - display_get_gui_height() / 2 - object_get_sprite_max_size(sans));
			camera_set_speed(5, 5);
		}],
		[cutscene_wait, 1/6],
		[cutscene_object_set_sprtie, net, spr_volleyball_net_breaking],
		[cutscene_wait, 1/6],
		[cutscene_execute, function() {
			sans.sprite_index = spr_sans_volleybro_flies_away_from_ball;
			sans.move(0, -5, 0.02);
			undyne.move(0, 5, 0.02);
			ball.punch(200, 1, 1);
			ball.step /= 10;
			ball.step_force /= 10;
			audio_sound_gain(snd_park, 0, 1000);
		}],
		[cutscene_wait, 0.5],
		[effect_fade, 3, 1, 2, c_white],
		[cutscene_wait, 2.5],
		[cutscene_execute, function() {
			instance_create(obj_gasters_apparition);
		}],
		[cutscene_wait, 2.5],
		[cutscene_execute, function() {
			frisk.sprite_index = spr_frisk_standing_up;
			papyrus_character.sprite_index = spr_papyrus_picnic_standing_up;
			sans.sprite_index = spr_sans_volleybro_falls_from_ball;
			sans.move(0, -24, 2);
			undyne.move(0, 100, 2);
			instance_destroy(ball);
			audio_sound_gain(snd_park, 1, 1000);
		}],
		[cutscene_dialog, episode + "Dialog26", dir.up],
		[cutscene_character_move, frisk, 0, -80, 2],
		[cutscene_object_set_sprtie, frisk, spr_frisk_walking_up],
		[cutscene_character_move, papyrus_character, 0, -80, 2],
		[cutscene_object_set_sprtie, papyrus_character, spr_papyrus_picnic_walking_up],
		[cutscene_wait, 2/3],
		[cutscene_object_set_sprtie, frisk, spr_frisk_standing_left],
		[cutscene_object_set_sprtie, papyrus_character, spr_papyrus_picnic_on_knees_right],
		[cutscene_dialog, episode + "Dialog27", dir.up],
		[cutscene_wait, 1],
		[cutscene_dialog_async, episode + "Dialog28", dir.up],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, sans, spr_sans_volleybro_sitting_after_fall],
		[cutscene_wait_by_dialog, 5],
		[cutscene_object_set_sprtie, sans, spr_sans_volleybro_stands_up_after_fall],
		[cutscene_object_set_sprtie, toriel, spr_toriel_picnic_sitting_looking_left_down],
		[cutscene_wait_dialog_end],
		[cutscene_execute, function() {
			instance_create_depth(450, 2914, fight_depth.player, jacket);
			camera_set_overwrite_position(438 - display_get_gui_width() / 2, 2918 - display_get_gui_height() / 2);
			camera_set_speed(2, 2);
		}],
		[cutscene_object_set_sprtie, sans, spr_sans_volleybro_walking_right_without_bandana],
		[cutscene_object_move_to, sans, 438, 2918, 2],
		[cutscene_execute, function() {
			instance_destroy(jacket);
		}],
		[cutscene_object_set_sprtie, sans, spr_sans_volleybro_taking_jacket],
		[cutscene_dialog, episode + "Dialog29", dir.up],
		[cutscene_object_set_sprtie, sans, spr_sans_volleybro_walking_right_with_jacket],
		[cutscene_character_move, sans, 400, 20, 2],
		[cutscene_wait, 2],
		[cutscene_dialog, episode + "Dialog30", dir.up],
		[cutscene_object_set_position, papyrus_character, 206, 2990],
		[cutscene_object_set_sprtie, papyrus_character, spr_papyrus_picnic_standing_down_worry],
		[cutscene_object_set_position, asgore, 163, 3013],
		[cutscene_object_set_sprtie, asgore, spr_asgore_picnic_standing_right],
		[cutscene_object_set_position, undyne, 206, 3039],
		[cutscene_object_set_sprtie, undyne, spr_undyne_picnic_standing_up],
		[cutscene_object_set_position, alphys, 241, 3010],
		[cutscene_object_set_sprtie, alphys, spr_alphys_picnic_standing_right],
		[cutscene_execute, function() {
			frisk.sprite_index = spr_frisk_standing_right;
			camera_set_overwrite_position(frisk.x - display_get_gui_width() / 2, frisk.y - display_get_gui_height() / 2);
			camera_set_speed(2, 2);
		}],
		[cutscene_wait, 2],
		[cutscene_object_set_position, sans, 2661, 2851],
		[cutscene_object_set_sprtie, sans, spr_sans_standing_right],
		[cutscene_execute, function() {
			frisk.control(true);
		}],
	]
];