event_inherited();

episode = "Underverse_Episode3.";

// Characters
cross = obj_character_cross;
xchara = obj_character_xchara;
nightmare = obj_character_nightmare;
dream = obj_character_dream;

// Soul
soul_sans_half = noone;

// Backgrounds
var layer_background_current = layer_get_id("Background");
var background_id = layer_background_get_id(layer_background_current);

// Cutscenes
cutscenes = [
	[	// X Chara with Sans's soul (Index: 0)
		[cutscene_execute, function () {
			audio_play_soundtrack(snd_dark_dream);
			soul_sans_half = instance_create_depth(210, 160, fight_depth.player, obj_scene_soul, {
				sprite_index: spr_monster_soul_half2
			});
		}],
		[cutscene_wait, 3],
		[cutscene_dialog, episode + "Dialog1"],
		[cutscene_object_set_sprtie, xchara, spr_xchara_on_knees_transform_cross_2],
		[audio_play_sound_once, snd_teleport],
		[cutscene_wait, 1],
		[cutscene_dialog, episode + "Dialog2"],
		[cutscene_wait, 0.5],
		[cutscene_object_set_sprtie, xchara, spr_cross_on_knees_turning_to_xchara],
		[audio_play_sound_once, snd_teleport],
		[cutscene_wait, 1],
		[cutscene_dialog, episode + "Dialog3"],
		[cutscene_object_set_sprtie, xchara, spr_xchara_on_knees_transform_cross_2],
		[audio_play_sound_once, snd_teleport],
		[cutscene_wait, 1],
		[cutscene_execute, function() { audio_play_soundtrack(snd_hope, false); }],
		[cutscene_dialog, episode + "Dialog4"],
		[cutscene_wait, 0.5],
		[cutscene_object_set_sprtie, xchara, spr_cross_on_knees_turning_to_xchara],
		[audio_play_sound_once, snd_teleport],
		[cutscene_wait, 1],
		[cutscene_dialog, episode + "Dialog5"],
		[cutscene_object_set_sprtie, xchara, spr_xchara_on_knees_transform_cross_3],
		[audio_play_sound_once, snd_teleport],
		[cutscene_wait, 1],
		[cutscene_dialog, episode + "Dialog6"],
		[cutscene_wait, 1],
		[cutscene_dialog, episode + "Dialog7"],
		[cutscene_wait, 1.5],
		[cutscene_dialog, episode + "Dialog8"],
		[cutscene_execute, function () {
			soul_sans_half.animating = false;
			soul_sans_half.speed = 0.1;
			soul_sans_half.direction = -25;
			
		}],
		[effect_fade, 2, 2, 2, c_white, false, fight_depth.ui],
		[cutscene_execute, function() {
			audio_sound_gain(snd_hope, 0, 2000);
		}],
		[cutscene_wait, 3],
		// Cross and XChara's spirit
		[cutscene_execute, function () {
			instance_destroy(xchara);
			instance_destroy(soul_sans_half);
			xchara = instance_create_depth(220, 160, fight_depth.player, obj_scene_soul, {
				sprite_index: spr_xchara_spirit_glad
			});
			cross = instance_create_depth(240, 176, fight_depth.player, obj_character_cross, {
				sprite_index: spr_cross_xevent_down_looking_down
			});
			audio_play_sound_once(snd_healing);
		}],
		[cutscene_wait, 3],
		[cutscene_execute, function() {
			audio_stop_sound(snd_hope);
		}],
		[cutscene_dialog_async, episode + "Dialog9"],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, cross, spr_cross_xevent_down_looking_left],
		[cutscene_wait_by_dialog, 5],
		[cutscene_object_set_sprtie, cross, spr_cross_xevent_down_looking_left_crossed_arms],
		[cutscene_wait_by_dialog, 6],
		[cutscene_execute, function () {
			xchara.sprite_index = spr_xchara_spirit_dissatisfied;
		}],
		[cutscene_wait_dialog_end],
		[cutscene_wait, 1],
		[cutscene_execute, function () {
			xchara.sprite_index = spr_xchara_spirit_shy;
		}],
		[cutscene_wait, 1],
		[cutscene_dialog, episode + "Dialog10"],
		[cutscene_wait, 2],
		// Angry Cross
		[cutscene_execute, function () {
			instance_destroy(cross);
			instance_destroy(xchara);
		}],
		[layer_background_sprite, background_id, spr_background_black],
		[audio_stop_sound, snd_dark_dream],
		[cutscene_wait, 1],
		[cutscene_execute, function () {
			cross = instance_create_depth(obj_camera.x + obj_camera.view_width, obj_camera.y + obj_camera.view_height,
				fight_depth.player, obj_character_cross, {
				sprite_index: spr_cross_xevent_full_angry
			});
			effect_shake(2, infinity);
			audio_play_sound(snd_jumpscare, 1, true);
		}],
		[cutscene_dialog, episode + "Dialog11"],
		[audio_stop_sound, snd_jumpscare],
		// Cross and Nightmare
		[layer_background_sprite, background_id, spr_background_empty_xtale_evening],
		[audio_play_soundtrack, snd_dark_dream],
		[cutscene_execute, function () {
			effect_shake(2, 0);
			instance_destroy(cross);
			cross = instance_create_depth(240, 176, fight_depth.player, obj_character_cross, {
				sprite_index: spr_cross_xevent_down_looking_left
			});
			nightmare = instance_create_depth(200, 176, fight_depth.player, obj_character_nightmare, {
				sprite_index: spr_nightmare_down_looking_up_tentacles
			});
		}],
		[cutscene_wait, 3],
		[cutscene_execute, function() {
			audio_play_soundtrack(snd_nightmare_appears, false);
		}],
		[cutscene_dialog_async, episode + "Dialog12"],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, nightmare, spr_nightmare_down_looking_right_tentacles],
		[cutscene_wait_dialog_end],
		[cutscene_wait, 1],
		[cutscene_dialog_async, episode + "Dialog13"],
		[cutscene_wait_by_dialog, 2],
		[cutscene_object_set_sprtie, nightmare, spr_nightmare_down_looking_up_tentacles],
		[cutscene_wait_dialog_end],
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, cross, spr_cross_xevent_down_looking_right_crossed_arms],
		[cutscene_wait, 2],
		[cutscene_object_set_sprtie, cross, spr_cross_xevent_down_looking_left_crossed_arms],
		[cutscene_dialog_async, episode + "Dialog14"],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, nightmare, spr_nightmare_down_looking_right_angry_tentacles],
		[cutscene_wait_dialog_end],
		[cutscene_object_set_sprtie, cross, spr_cross_xevent_getting_knife_looking_left],
		[cutscene_dialog, episode + "Dialog15"],
		// Dream is coming
		[cutscene_execute, function () {
			dream = instance_create_depth(780, 176, fight_depth.player, obj_character_dream, {
				sprite_index: spr_dream_left_walking_greets
			});
		}],
		[cutscene_character_move, dream, -280, 0, 1],
		[cutscene_camera_move_to, 280, 0, 1],
		[cutscene_object_set_sprtie, dream, spr_dream_left_walking_greets_finish],
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, dream, spr_dream_left_hand_down_afraid],
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, dream, spr_dream_left_worried],
		[cutscene_wait, 0.5],
		[cutscene_dialog, episode + "Dialog16"],
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, dream, spr_dream_left_worried_teleporting],
		[audio_play_sound_once, snd_spare],
		[cutscene_wait, 1],
		[effect_fade, 3, 2, 2, c_black, true, fight_depth.ui],
		[cutscene_execute, function() {
			audio_sound_gain(snd_nightmare_appears, 0, 2000);
		}],
		[cutscene_wait, 4],
		[cutscene_execute, function() {
			audio_stop_sound(snd_nightmare_appears);
		}],
		[room_goto, room_menu]
	]
];