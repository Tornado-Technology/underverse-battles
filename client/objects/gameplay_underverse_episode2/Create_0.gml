on_into_story_mode.invoke("Tutorial");

episode = "Underverse_Episode2.";

// Fight
fight = obj_fight_underverse_episode2;

// Characters
ink_sans = obj_character_ink_sans;
sans = obj_character_sans;
cross = obj_character_cross;
error_sans = obj_character_error_sans;
xchara = obj_character_xchara;

// Props
notebook = noone;
paintings = noone;
core_frisk = noone;
string_error_sans = [];
string_cross = [];

// Soul
soul_cross = noone;

// Data
fight_position_event = false;
player0_hp_turn2 = 100;

// Backgrounds
var layer_background_current = layer_get_id("Background");
var background_id = layer_background_get_id(layer_background_current);

// Particles
particle_paper = part_type_create();
part_type_sprite(particle_paper, spr_paper_ink_sans, false, false, false);
part_type_life(particle_paper, 240, 240);
part_type_speed(particle_paper, 2.5, 2.5, -0.01, 0);
part_type_direction(particle_paper, -30, -30, 0, 0);
part_type_orientation(particle_paper, 0, 0, 10, 0, false);

particle_pencil = part_type_create();
part_type_sprite(particle_pencil, spr_pencil_ink_sans, false, false, false);
part_type_life(particle_pencil, 240, 240);
part_type_speed(particle_pencil, 2.5, 2.5, -0.01, 0);
part_type_direction(particle_pencil, -50, -50, 0, 0);
part_type_orientation(particle_pencil, 0, 0, 10, 0, false);

// Time sources
time_source_restart = time_source_create(time_source_game, 5, time_source_units_seconds, function() {
	cutscene_set(4);
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

cutscene_special_attack = function () {
	cutscene_set(8);
}

// Cutscenes
cutscenes = [
	[
		[cutscene_execute, function () {
			audio_play_sound(snd_park, 2, true);
			audio_sound_gain(snd_park, 1, 0);
		}],
		[cutscene_wait, 4],
		[cutscene_dialog, episode + "Dialog1"],
		[cutscene_wait, 3],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting2],
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting1],
		[cutscene_dialog_async, episode + "Dialog2"],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting1],
		[cutscene_wait_by_dialog, 3],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting2],
		[cutscene_wait_dialog_end],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting3],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting3],
		[cutscene_choise, episode + "Choise1", function (index) { cutscene_create(cutscenes[index + 1]); }]
	],
	[
		// Sans selected "Listen"
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting1],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting2],
		[cutscene_wait, 1],
		[cutscene_dialog, episode + "Dialog3_Line1"],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_pukes],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting5],
		[audio_play_sound_once, snd_ink_puking],
		[cutscene_wait, 3],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting_joyful],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting6],
		[cutscene_dialog_async, episode + "Dialog4_Line1"],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_apologetic],
		[cutscene_wait_dialog_end],
		[effect_fade, 4, 1, c_white, c_white, false, fight_depth.ui],
		[cutscene_execute, function () { audio_sound_gain(snd_park, 0, 4000); }],
		[cutscene_wait, 4],
		// Doodle Sphere
		[layer_background_sprite, background_id, spr_background_doodle_sphere_layer_0],
		[cutscene_execute, function () {
			background_animator = instance_create(obj_background_doodle_sphere_without_platform);
			audio_play_sound(snd_into_clear_void, 2, true);
			audio_stop_sound(snd_park);
			instance_destroy(sans);
			ink_sans.x -= 20;
			ink_sans.y -= 50;
			ink_sans.sprite_index = spr_ink_sans_flying_painting;
		}],
		[cutscene_wait, 1],
		[cutscene_dialog_async, episode + "Dialog5_Line1"],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_flying_distracting],
		[cutscene_wait_by_dialog, 3],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_flying_throwing_stuff],
		[cutscene_wait, 2],
		[cutscene_execute, function () {
			part_particles_create(global.part_system_bullet, ink_sans.x + 10, ink_sans.y - 16, particle_paper, 1);
			part_particles_create(global.part_system_bullet, ink_sans.x + 3, ink_sans.y - 27, particle_pencil, 1);
		}],
		[cutscene_wait_dialog_end],
		[effect_fade, 1, 1, c_black, c_black, false, fight_depth.ui_hight],
		[cutscene_wait, 1],
		// Empty XTale universe
		[layer_background_sprite, background_id, spr_background_empty_xtale],
		[cutscene_execute, function () { instance_destroy(background_animator); }],
		[cutscene_execute, function () {
			part_particles_clear(global.part_system_bullet);
			ink_sans.y += 20;
			ink_sans.sprite_index = spr_ink_sans_right_calm;
		}],
		[cutscene_dialog_async, episode + "Dialog6_Line1"],
		[cutscene_execute_by_dialog, 1, function () { cross = instance_create_depth(490, ink_sans.y, fight_depth.player, obj_character_cross, { sprite_index: spr_cross_sitting_crying }); }],
		[cutscene_camera_move_to, 70, 0, 1.2],
		[cutscene_wait_by_dialog, 4],
		[cutscene_object_set_sprtie, cross, spr_cross_sitting_crying_turns_around],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_walking_right_calm],
		[cutscene_character_move, ink_sans, 70, 0, 0.3],
		[cutscene_wait_by_dialog, 5],
		[cutscene_object_set_sprtie, cross, spr_cross_sitting_crying_turns_back],
		[cutscene_character_skip_moving, ink_sans],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sits_down],
		[cutscene_wait_dialog_end],
		// Ink and Cross are sitting together
		[effect_fade, 1, 1, c_black, c_black, false, fight_depth.ui],
		[cutscene_wait, 1],
		[cutscene_dialog_async, episode + "Dialog7_Line1"],
		[cutscene_object_set_position, ink_sans, 10, 0],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting_looking_down],
		[cutscene_object_set_position, cross, -140, 0],
		[cutscene_object_set_sprtie, cross, spr_cross_sitting_wipes_away_tears],
		[cutscene_execute, function () { notebook = instance_create_depth(cross.x - 2, cross.y + 10, fight_depth.player, obj_prop, { sprite_index: spr_notebook_ink_sans }); }],
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting_looking_right],
		[cutscene_wait_dialog_end],
		[effect_fade, 1, 1, c_black, c_black, false, fight_depth.ui],
		[cutscene_wait, 1],
		// Back to Sans and Ink in forest park
		[layer_background_sprite, background_id, spr_background_underverse_forest],
		[cutscene_execute, function () {
			audio_play_sound(snd_park, 2, true);
			audio_sound_gain(snd_park, 1, 0);
		}],
		[cutscene_camera_set_position, 0, 0],
		[cutscene_execute, function () {
			instance_destroy(notebook);
			instance_destroy(ink_sans);
			instance_destroy(cross);
			ink_sans = instance_create_depth(255, 197, fight_depth.player, obj_character_ink_sans, { sprite_index: spr_ink_sans_sitting1 });
			sans = instance_create_depth(223, 197, fight_depth.player, obj_character_sans, { sprite_index: spr_sans_sitting7 });
		}],
		[cutscene_dialog_async, episode + "Dialog8_Line1"],
		[cutscene_wait_by_dialog, 2],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting2],
		// Memories in empty XTale universe
		[cutscene_execute, function () { audio_stop_sound(snd_park); }],
		[cutscene_wait_by_dialog, 4],
		[layer_background_sprite, background_id, spr_background_empty_xtale],
		[cutscene_execute, function () {
			instance_destroy(sans);
			ink_sans.x -= 20;
			ink_sans.y -= 30;
			ink_sans.sprite_index = spr_ink_sans_laughs;
			cross = instance_create_depth(ink_sans.x + 40, ink_sans.y, fight_depth.player, obj_character_cross, { sprite_index: spr_cross_left_trolled });
		}],
		[cutscene_wait, 3],
		[cutscene_execute, function () {
			ink_sans.x -= 20;
			ink_sans.sprite_index = spr_char_ink_sans_rad_cosplay;
			cross.x -= 10;
			cross.sprite_index = spr_cross_watching_rad_cosplay;
		}],
		[cutscene_wait, 3],
		[cutscene_execute, function () {
			ink_sans.x += 40;
			ink_sans.sprite_index = spr_ink_sans_right_painting0;
			cross.x += 23;
			cross.sprite_index = spr_cross_painted0;
		}],
		[cutscene_wait, 1],
		[cutscene_execute, function () {
			ink_sans.sprite_index = spr_ink_sans_right_painting1;
			cross.sprite_index = spr_cross_painted1;
		}],
		[cutscene_wait, 2],
		[cutscene_wait_dialog_end],
		// Ink and Cross are runing
		[cutscene_execute, function () {
			ink_sans.x += 250;
			ink_sans.sprite_index = spr_ink_sans_running_left;
			cross.x += 290;
			cross.sprite_index = spr_cross_running_left_to_ink;
		}],
		[cutscene_character_move, ink_sans, -625, 0, 2.5],
		[cutscene_character_move, cross, -625, 0, 2.5],
		[cutscene_wait, 5],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_running_right_without_broomie],
		[cutscene_object_set_sprtie, cross, spr_cross_running_right_with_broomie],
		[cutscene_character_move, ink_sans, 625, 0, 2],
		[cutscene_character_move, cross, 625, 0, 2],
		[cutscene_wait, 4],
		[effect_fade, 1, 1, c_black, c_black, false, fight_depth.ui],
		[cutscene_wait, 1],
		// Ink and Cross are sitting
		[cutscene_execute, function () {
			instance_destroy(ink_sans);
			ink_sans = instance_create_depth(220, 167, fight_depth.player, obj_character_ink_sans, { sprite_index: spr_ink_sans_sitting_right0 });
			instance_destroy(cross);
			cross = instance_create_depth(274, 167, fight_depth.player, obj_character_cross, { sprite_index: spr_cross_left_sitting_calm });
			paintings = instance_create_depth(250, 167, fight_depth.player, obj_prop, { sprite_index: spr_drawings });
		}],
		[cutscene_dialog_async, episode + "Dialog9_Line1"],
		[cutscene_wait, 2],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting_right1],
		[cutscene_object_set_sprtie, cross, spr_cross_left_calm],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting_right1],
		[cutscene_object_set_sprtie, cross, spr_cross_left_calm],
		[cutscene_wait_dialog_end],
		[effect_fade, 2, 2, c_white, c_white, false, fight_depth.ui],
		[cutscene_wait, 2],
		// Core Frisk
		[layer_background_sprite, background_id, spr_background_dream],
		[cutscene_dialog_async, episode + "Dialog10_Line1", dir.down],
		[cutscene_execute, function () {
			instance_destroy(ink_sans);
			instance_destroy(cross);
			instance_destroy(paintings);
			core_frisk = instance_create_depth(240, 220, fight_depth.player, obj_prop, { sprite_index: spr_core_frisk_full });
		}],
		[cutscene_wait_dialog_end],
		[effect_fade, 2, 1, c_white, c_white, false, fight_depth.ui],
		[cutscene_wait, 2],
		// Back to Sans and Ink in forest park
		[layer_background_sprite, background_id, spr_background_underverse_forest],
		[cutscene_execute, function () {
			audio_play_sound(snd_park, 2, true);
			audio_sound_gain(snd_park, 1, 0);
		}],
		[cutscene_execute, function () {
			instance_destroy(core_frisk);
			ink_sans = instance_create_depth(255, 197, fight_depth.player, obj_character_ink_sans, { sprite_index: spr_ink_sans_sitting7 });
			sans = instance_create_depth(223, 197, fight_depth.player, obj_character_sans, { sprite_index: spr_sans_sitting2 });
		}],
		[cutscene_wait, 1],
		[cutscene_dialog_async, episode + "Dialog11_Line1"],
		[cutscene_wait_by_dialog, 2],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting7],
		[cutscene_wait_by_dialog, 3],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting8],
		[cutscene_wait_dialog_end],
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting8],
		[cutscene_wait, 1],
		[cutscene_dialog, episode + "Dialog12_Line1"],
		[cutscene_wait, 2],
		[cutscene_dialog_async, episode + "Dialog13_Line1"],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting6],
		[cutscene_wait_dialog_end],
		[cutscene_execute, function () { audio_sound_gain(snd_park, 0, 2000); }],
		[effect_fade, 2, 2, c_white, c_white, false, fight_depth.ui],
		[cutscene_wait, 2],
		[cutscene_execute, function () {
			audio_stop_sound(snd_park);
			instance_destroy(ink_sans);
			instance_destroy(sans);
		}],
		[cutscene_execute, function () { cutscene_create(cutscenes[3]); }]
	],
	[
		// Sans selected "No. Get lost"
		[cutscene_wait, 1],
		[cutscene_execute, function () { sans.sprite_index = spr_sans_sitting4; }],
		[cutscene_dialog_async, episode + "Dialog3_Line2"],
		[cutscene_execute_by_dialog, 1, function () {
			ink_sans.sprite_index = spr_ink_sans_sitting1;
		}],
		[cutscene_execute_by_dialog, 2, function () {
			sans.sprite_index = spr_sans_sitting3;
		}],
		[cutscene_execute_by_dialog, 3, function () { 
			sans.sprite_index = spr_sans_sitting1;
			ink_sans.sprite_index = spr_ink_sans_sitting3;
		}],
		[cutscene_execute_by_dialog, 4, function () { 
			ink_sans.sprite_index = spr_ink_sans_down_empty_eyes;
		}],
		[cutscene_wait_dialog_end],
		[cutscene_wait, 2.5],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_right_empty_eyes],
		[cutscene_dialog, episode + "Dialog4_Line2"],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_right_empty_eyes_walking],
		[cutscene_character_move, ink_sans, 300, 0, 2],
		[cutscene_wait, 3],
		[cutscene_execute, function () {
			instance_destroy(ink_sans);
			sans.sprite_index = spr_sans_sitting0; 
		}],
		[cutscene_wait, 2],
		[cutscene_dialog_async, episode + "Dialog5_Line2"],
		[cutscene_execute_by_dialog, 1, function () { 
			sans.sprite_index = spr_char_sans_left; 
		}],
		[cutscene_wait_dialog_end],
		[cutscene_object_set_sprtie, sans, spr_char_sans_walk_left],
		[cutscene_character_move, sans, -300, 0, 2],
		[cutscene_wait, 1],
		[cutscene_execute, function () { audio_sound_gain(snd_park, 0, 2000); }],
		[effect_fade, 2, 2, c_black, c_black, false, fight_depth.ui],
		[cutscene_wait, 2],
		[cutscene_execute, function () {
			instance_destroy(sans);
		}],
		[cutscene_execute, function () { audio_stop_sound(snd_park); }],
		[cutscene_execute, function () { cutscene_create(cutscenes[3]); }]
	],
	[
		// Ink and Cross in empty Xtale
		[layer_background_sprite, background_id, spr_background_empty_xtale],
		[cutscene_execute, function () {
			ink_sans = instance_create_depth(250, 167, fight_depth.player, obj_character_ink_sans, { sprite_index: spr_ink_sans_left_regrets0 });
			cross = instance_create_depth(200, 167, fight_depth.player, obj_character_cross, { sprite_index: spr_cross_shocked });
		}],
		[cutscene_wait, 2],
		[cutscene_dialog_async, episode + "Dialog14"],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, cross, spr_cross_angry],
		[cutscene_wait_dialog_end],
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_left_regrets1],
		[cutscene_wait, 1],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_down_empty_eyes],
		[cutscene_wait_dialog_end],
		[cutscene_wait, 0.5],
		[cutscene_dialog_async, episode + "Dialog15"],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_right_empty_eyes],
		[cutscene_wait_dialog_end],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_right_empty_eyes_walking],
		[cutscene_character_move, ink_sans, 420, 0, 2],
		[cutscene_object_set_sprtie, cross, spr_cross_left_closed_eyes],
		[cutscene_wait_dialog_end],
		[effect_fade, 1, 1, c_black, c_black, false, fight_depth.ui],
		[cutscene_wait, 1],
		// Cross alone
		[cutscene_execute, function () {
			instance_destroy(ink_sans);
		}],
		[cutscene_object_set_sprtie, cross, spr_cross_left_lying],
		[cutscene_wait, 2],
		[cutscene_object_set_sprtie, cross, spr_cross_left_gets_up],
		[cutscene_wait, 1.5],
		[cutscene_object_set_sprtie, cross, spr_cross_left_turns_around],
		[cutscene_dialog, episode + "Dialog16"],
		[cutscene_execute, function () {
			var i = 0;
			repeat(3) {
				string_error_sans[i] = instance_create_depth(485, cross.y - 20 + i * 3, fight_depth.player, obj_string_error_sans_story_mode, {
					depth: fight_depth.bullet,
					scale_speed: 5,
					max_scale: 280
				});
				string_error_sans[i].shoot(cross.x, cross.y - 15);
				i++;
			}
		}],
		[cutscene_wait, 1],
		[effect_blackout_start, c_black, false, fight_depth.ui],
		[cutscene_execute, function() { instance_destroy_array(string_error_sans); }],
		[audio_play_sound_once, snd_spare_up],
		[cutscene_wait, 0.5],
		[cutscene_execute, function () { cutscene_create(cutscenes[4]); }]
	],
	[
		// Cross in strings
		[layer_background_sprite, background_id, spr_background_empty_xtale_error],
		[cutscene_execute, function () {
			if (!instance_exists(cross)) {
				cross = instance_create_depth(200, 167, fight_depth.player, obj_character_cross, { sprite_index: spr_cross_in_strings });
			}
		}],
		[cutscene_object_set_position, cross, -30, -30],
		[cutscene_object_set_sprtie, cross, spr_cross_in_strings],
		[cutscene_wait, 1],
		[effect_blackout_end],
		[cutscene_execute, function () {
			var i = 0;
			repeat(4) {
				string_cross[i] = instance_create_depth(cross.x - 8 + i * 3, cross.y - 26, fight_depth.player, obj_string_error_sans_story_mode, {
					depth: fight_depth.player,
					scale_speed: 0,
					image_xscale: 200,
					max_scale: 200,
					direction: 90,
					image_angle: 90
				});
				string_cross[i].following_character = cross;
				i++;
			}
		}],
		[cutscene_wait, 1],
		// Error Sans is coming
		[cutscene_execute, function () {
			error_sans = instance_create_depth(510, 167, fight_depth.player, obj_character_error_sans, { sprite_index: spr_error_sans_right_strings_walking } );
			var i = 0;
			repeat(2) {
				string_error_sans[i] = instance_create_depth(error_sans.x - 17 + i * 2, error_sans.y - 20, fight_depth.player, obj_string_error_sans_story_mode, {
					depth: fight_depth.bullet,
					scale_speed: 6,
					image_xscale: 200,
					direction: 90,
					image_angle: 90,
					max_scale: 200
				});
				string_error_sans[i].following_character = error_sans;
				i++;
			}
		}],
		[cutscene_character_move, error_sans, -100, 0, 1.2],
		[cutscene_wait, 2],
		[cutscene_dialog, episode + "Dialog17"],
		[cutscene_object_set_sprtie, error_sans, spr_error_sans_right_strings_up],
		[cutscene_execute, function () {
			var i = 0;
			repeat(2) {
				string_error_sans[i].remove();
				i++;
			}
		}],
		[cutscene_wait, 1.5],
		// Error Sans takes Cross's soul
		[cutscene_object_set_sprtie, error_sans, spr_error_sans_right_hand],
		[cutscene_execute, function () {
			var i = 0;
			repeat(2) {
				string_error_sans[i] = instance_create_depth(error_sans.x - 17 + i * 2, error_sans.y - 18 - i * 2, fight_depth.bullet, obj_string_error_sans_story_mode, {
					scale_speed: 6,
					max_scale: 220
				});
				string_error_sans[i].shoot(cross.x, cross.y - 17);
				i++;
			}
		}],
		[cutscene_wait, 1],
		[cutscene_execute, function () {
			soul_cross = instance_create_depth(cross.x, cross.y - 17, fight_depth.bullet, obj_scene_soul, { sprite_index: spr_soul_cross });
			soul_cross.animating = false;
			audio_play_sound_once(snd_spare_up);
		}],
		[cutscene_object_set_sprtie, cross, spr_cross_in_strings_closed_eyes],
		[cutscene_wait, 1],
		[cutscene_execute, function () {
			var i = 0;
			repeat(2) {
				string_error_sans[i].pull();
				i++;
			}
			soul_cross.move(392, 150, 6);
		}],
		[cutscene_wait, 1.6],
		// Ink Sans is coming
		[cutscene_execute, function () {
			ink_sans = instance_create_depth(error_sans.x + 100, error_sans.y, fight_depth.player, obj_character_ink_sans, { sprite_index: spr_ink_sans_attack_flying });
		}],
		[cutscene_character_move, ink_sans, -90, 0, 4],
		[cutscene_wait, 0.1],
		[cutscene_object_set_sprtie, cross, spr_cross_in_strings],
		[cutscene_object_set_sprtie, error_sans, spr_error_sans_dodge_jump_back],
		[cutscene_wait, 0.1],
		[cutscene_execute, function () {
			instance_destroy(soul_cross);
		}],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_attack_flying_hit],
		[cutscene_character_move, error_sans, -160, 0, 3.2],
		[audio_play_sound_once, snd_projectile],
		[cutscene_wait, 1.5],
		[cutscene_dialog, episode + "Dialog18"],
		// Fight begins
		[cutscene_execute, function () {
			instance_create(fight);
			fight_position_event = true;
		}],
		[cutscene_fight_wait_turn, 2],
		[cutscene_execute, function () {
			player0_hp_turn2 = fight_get_player_hp(0);
			fight_set_ui_showing_action_box(false);
			fight_set_player_input(false);
			timer_stop();
			fight_set_pause(true);
		}],
		[cutscene_wait, 0.6],
		[cutscene_dialog, episode + "Dialog19", dir.down],
		[cutscene_execute, function () {
			fight_set_ui_showing_action_box(true);
			fight_set_player_input(true);
			timer_start();
			fight_set_pause(false);
		}],
		[cutscene_fight_wait_turn, 4],
		[cutscene_execute, function () {
			fight_set_ui_showing_action_box(false);
			fight_set_player_input(false);
			timer_stop();
			fight_set_pause(true);
		}],
		[cutscene_wait, 0.6],
		[cutscene_execute, function () {
			if (player0_hp_turn2 > fight_get_player_hp(0)) {
				cutscene_create(cutscenes[5]);
			} else {
				cutscene_create(cutscenes[6]);
			}
		}],
	],
	[
		// If player took damage
		[cutscene_dialog, is_mobile ? episode + "TakeDamageMobile" : episode + "TakeDamage", dir.down],
		[cutscene_execute, function () { cutscene_create(cutscenes[7]); }]
	],
	[
		// If player didn't take damage
		[cutscene_dialog, is_mobile ? episode + "DontTakeDamageMobile" : episode + "DontTakeDamage", dir.down],
		[cutscene_execute, function () { cutscene_create(cutscenes[7]); }]
	],
	[
		// Fight continue
		[cutscene_execute, function () {
			fight_set_ui_showing_action_box(true);
			fight_set_player_input(true);
			timer_start();
			fight_set_pause(false);
		}],
		[cutscene_fight_wait_turn, 20],
		[cutscene_execute, function () {
			fight_set_ui_showing_action_box(false);
			fight_set_player_input(false);
			timer_stop();
			fight_set_pause(true);
		}],
		[cutscene_wait, 0.6],
		[cutscene_dialog, episode + "Dialog20", dir.down],
		[cutscene_execute, function () {
			fight_set_player_special_action_persent(0, 100);
			fight_set_showing_special_action(true);
			fight_set_ui_showing_action_box(true);
			fight_set_player_input(true);
			timer_start();
			fight_set_pause(false);
		}],
	],
	[
		// Special attack
		[cutscene_execute, function () {
			fight_position_event = false;
			instance_destroy(fight);
			
			repeat (3) create_aiming_gasterblaster(obj_gasterblaster_aiming_error_sans, ink_sans);
		}],
		[cutscene_wait, 1],
		[effect_fade, 0.5, 7, c_white, c_white, false, fight_depth.ui],
		[cutscene_wait, 0.5],
		// Ink Sans and XChara
		[layer_background_sprite, background_id, spr_background_empty_xtale],
		[cutscene_execute, function () {
			instance_destroy_array(string_cross);
			instance_destroy(cross);
			instance_destroy(error_sans);
			
			ink_sans.sprite_index = spr_ink_sans_lying_wounded;
			xchara = instance_create_depth(120, 167, fight_depth.player, obj_character_xchara, { sprite_index: spr_xchara_lying_wounded });
		}],
		[cutscene_wait, 8],
		[cutscene_object_set_sprtie, xchara, spr_xchara_stand_up_on_knees],
		[cutscene_wait, 1.5],
		[cutscene_object_set_sprtie, xchara, spr_xchara_on_knees_looking_hands],
		[cutscene_wait, 0.5],
		[cutscene_dialog_async, episode + "Dialog21"],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, xchara, spr_xchara_on_knees_transform_cross],
		[cutscene_wait_by_dialog, 2],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_lying_wounded_head_up],
		[cutscene_object_set_sprtie, xchara, spr_xchara_on_knees_transform_back],
		[cutscene_wait_dialog_end],
		[cutscene_object_set_sprtie, xchara, spr_xchara_on_knees_turns_forward],
		[cutscene_wait, 1.2],
		[cutscene_object_set_sprtie, xchara, spr_xchara_on_knees_teleporting],
		[audio_play_sound_once, snd_teleport],
		[cutscene_wait, 2],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_lying_wounded],
		[cutscene_dialog, episode + "Dialog22"],
		[effect_fade, 3, 1, c_black, c_black, false, fight_depth.ui],
		[cutscene_wait, 3],
		[room_goto, room_menu]
	]
];