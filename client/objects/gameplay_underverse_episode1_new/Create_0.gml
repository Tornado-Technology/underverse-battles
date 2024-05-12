on_into_story_mode.invoke("Tutorial");

episode = "Underverse_Episode1.";

// Characters
ink_sans = obj_character_ink_sans;
sans = obj_character_sans;
xchara = obj_character_xchara;

// Props
pink_inks = noone;

// Soul
soul_sans = noone;
soul_sans_half = noone;


scenario = 0;
fight_position_event = false;
scene_position_event = false;

sans_met_xchara = false;

// Backgrounds
var layer_background_current = layer_get_id("Background");
var background_id = layer_background_get_id(layer_background_current);

// Cutscenes
cutscenes = [
	[
		// Sans appeared
		[cutscene_wait, 3],
		[cutscene_execute, function () { sans.moveable = true; }],
	],
	[
		// Sans met XChara
		[cutscene_execute, function () {
			sans.moveable = false;
			sans.sprite_index = spr_char_sans_idle;
			camera_set_speed(1, 1);
			camera_set_overwrite_position(room_width - 540, y);
		}],
		[cutscene_wait, 2.5],
		[cutscene_dialog, episode + "Dialog1"],
		[cutscene_wait, 2.5],
		// Soul stealing
		[cutscene_execute, function () {
			soul_sans = instance_create_depth(sans.x + 20, sans.y - sans.sprite_height / 2, fight_depth.player, obj_scene_soul);
			soul_sans.sprite_index = spr_monster_soul;
			soul_sans.animating = false;
			xchara.sprite_index = spr_xchara_hand_forward;
			xchara.image_xscale = -1;
		}],
		[cutscene_wait, 0.3],
		[cutscene_execute, function () {
			soul_sans.sprite_index = spr_monster_soul_blue;
			audio_play_sound_once(snd_swing);
		}],
		[cutscene_wait, 0.1],
		[cutscene_object_set_sprtie, sans, spr_char_sans_controlled],
		[cutscene_object_move_to, sans, 1000, room_height/2, 3],
		[cutscene_object_move_to, soul_sans, 1000, room_height/2, 3],
		[cutscene_wait, 0.3],
		[cutscene_execute, function () {
			effect_blackout_start(c_black, true, 0);
			audio_play_sound_plugging(snd_soul_division);
			audio_stop_sound(snd_dark_dream);
		}],
		[cutscene_wait, 1],
		[layer_background_sprite, background_id, spr_background_underverse_forest_park],
		[cutscene_execute, function () {
			audio_play_soundtrack(snd_fallen_child, true, 0.5);
		}],
		[cutscene_wait, 1],
		[cutscene_execute, function () {
			sans.x = room_width - 340;
			sans.y += 80;
			xchara.x = room_width - 230;
			xchara.y += 80;
			
			sans.sprite_index = spr_char_sans_defeated;
			xchara.sprite_index = spr_xchara_get_soul;
			
			instance_destroy(soul_sans);
	
			soul_sans = instance_create_depth(xchara.x + xchara.sprite_width / 2 - 6, xchara.y - 25, fight_depth.player, obj_scene_soul);
			scene_soul_set_sprite(soul_sans, spr_monster_soul_half2);
	
			soul_sans_half = instance_create_depth(sans.x + 16, sans.y - sans.sprite_height / 2, fight_depth.player, obj_scene_soul);
			scene_soul_set_sprite(soul_sans_half, spr_monster_soul_half1);
			effect_blackout_end();
		}],
		[cutscene_wait, 1],
		[cutscene_dialog, episode + "Dialog2"],
		[cutscene_wait, 2],
		// Ink Sans is coming
		[cutscene_execute, function () {
			ink_sans = instance_create_depth(sans.x - 250, sans.y - 80, fight_depth.player, obj_character_ink_sans, { sprite_index: spr_char_ink_sans_flip });
		}],
		[cutscene_character_move, ink_sans, 190, 80, 2],
		[cutscene_wait, 1],
		[cutscene_execute, function () {
			pink_inks = instance_create_depth(ink_sans.x, ink_sans.y - 15, fight_depth.player - 1, obj_prop, { sprite_index: spr_flying_inks });
			audio_play_sound_plugging(snd_stab);
		}],
		[cutscene_character_move, xchara, 5, 0, 0.2],
		[cutscene_wait, 1.5],
		[cutscene_execute, function () {
			xchara.sprite_index = spr_xchara_in_inks;
			instance_destroy(soul_sans_half);
		}],
		[cutscene_wait, 1.5],
		[cutscene_dialog, episode + "Dialog3"],
		// Start fight
		[cutscene_execute, function () {
			instance_destroy(soul_sans);
			instance_create_depth(obj_camera.camera_position.x, obj_camera.camera_position.y, -100, fight_underverse_00);
			fight_position_event = true;
		}],
		[cutscene_wait, 0.5],
		// Try to dodge
		[cutscene_dialog_async, episode + "Dialog4"],
		[cutscene_wait_by_dialog, 2],
		[cutscene_execute, function () {
			instance_create_depth(room_width - 320, 25, 0, obj_bar_border_outline);
		}],
		[cutscene_wait_by_dialog, 4],
		[cutscene_execute, function () {
			instance_destroy(obj_bar_border_outline);
		}],
		[cutscene_wait_dialog_end],
		[cutscene_execute, function () {
			fight_set_initiative(1);
			fight_set_player_action(0, 3);
			fight_set_player_action(1, irandom_range(0, 1));
			fight_set_pause(false);
		}],
		[cutscene_fight_wait_turn, 1],
		// Try to attack
		[cutscene_execute, function () {
			var trigger = fight_get_player_hp(0) == fight_get_player_max_hp(0);
			var text_ = translate_get("Dialog." + episode + "Dialog5");

			array_delete(text_, trigger, 1);

			instance_dialog = dialog_create(text_);
			
			fight_set_pause(false);
		}],
		[cutscene_wait_dialog_end],
		[cutscene_execute, function () {
			fight_set_player_skip(1);
			fight_set_initiative(0);
			
			fight_set_ui_showing_action_box(true);
			fight_set_player_input(true);
			fight_set_pause(true);
		}],
		[cutscene_fight_wait_turn, 2],
	],
]