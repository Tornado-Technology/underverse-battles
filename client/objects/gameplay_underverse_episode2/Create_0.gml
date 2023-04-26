on_into_story_mode.invoke("Tutorial");

episode = "Underverse_Episode2.";

// Characters
ink_sans = obj_character_ink_sans;
sans = obj_character_sans;
cross = obj_character_cross;

// Backgrounds
var layer_background_current = layer_get_id("Background");
var background_id = layer_background_get_id(layer_background_current);

// Particles
particle_paper = part_type_create();
part_type_sprite(particle_paper, spr_paper_ink_sans, false, false, false);
part_type_life(particle_paper, 240, 240);
part_type_speed(particle_paper, 2.5, 2.5, -0.01, 0);
part_type_direction(particle_paper, 180, 180, 0, 0);
part_type_orientation(particle_paper, 0, 0, 10, 0, false);

particle_pencil = part_type_create();
part_type_sprite(particle_pencil, spr_pencil_ink_sans, false, false, false);
part_type_life(particle_pencil, 240, 240);
part_type_speed(particle_pencil, 2.5, 2.5, -0.01, 0);
part_type_direction(particle_pencil, 0, 0, 0, 0);
part_type_orientation(particle_pencil, 0, 0, 10, 0, false);

// Cutscenes
cutscenes = [
	[
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
		[cutscene_wait, 3],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting_joyful],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting6],
		[cutscene_dialog_async, episode + "Dialog4_Line1"],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_apologetic],
		[cutscene_wait_dialog_end],
		[effect_fade, 4, 1, c_white, c_white, true, 0],
		[cutscene_wait, 4],
		// Doodle Sphere
		[layer_background_sprite, background_id, spr_background_doodle_sphere],
		[cutscene_execute, function () { audio_play_sound(snd_into_clear_void, 2, true); }],
		[cutscene_execute, function () { instance_destroy(sans); ink_sans.x -= 20; ink_sans.y -= 50; ink_sans.sprite_index = spr_ink_sans_flying_painting; }],
		[cutscene_wait, 1],
		[cutscene_dialog_async, episode + "Dialog5_Line1"],
		[cutscene_wait_by_dialog, 1],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_flying_distracting],
		[cutscene_wait_by_dialog, 3],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_flying_throwing_stuff],
		[cutscene_wait, 0.6],
		[cutscene_execute, function () {
			part_particles_create(global.part_system_bullet, ink_sans.x - 5, ink_sans.y - 15, particle_paper, 1);
			part_particles_create(global.part_system_bullet, ink_sans.x + 5, ink_sans.y - 15, particle_pencil, 1);
		}],
		[cutscene_wait_dialog_end],
		[effect_fade, 1, 1, c_black, c_black, true, 0],
		[cutscene_wait, 1],
		// Empty XTale universe
		[layer_background_sprite, background_id, spr_background_dream],
		[cutscene_execute, function () { ink_sans.y += 20; ink_sans.sprite_index = spr_ink_sans_right_calm; }],
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
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting_takes_notebook],
		[cutscene_wait_dialog_end],
		[effect_fade, 1, 1, c_black, c_black, true, 0],
		[cutscene_wait, 1],
		[cutscene_dialog_async, episode + "Dialog7_Line1"],
		[cutscene_object_set_position, ink_sans, 10, 0],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_sitting0],
		[cutscene_object_set_position, cross, -140, 0],
		[cutscene_object_set_sprtie, cross, spr_cross_sitting_wipes_away_tears],
		[cutscene_wait_dialog_end],
		[effect_fade, 1, 1, c_black, c_black, true, 0],
		[cutscene_wait, 1],
		// Back to Sans and Ink in forest park
		[cutscene_wait_by_dialog, 1],
		[layer_background_sprite, background_id, spr_background_underverse_forest],
		[cutscene_camera_set_position, 0, 0],
		[cutscene_execute, function () {
			instance_destroy(ink_sans);
			ink_sans = instance_create_depth(255, 197, fight_depth.player, obj_character_ink_sans, { sprite_index: spr_ink_sans_sitting1 });
		}],
		[cutscene_execute, function () {
			instance_destroy(cross);
			sans = instance_create_depth(223, 197, fight_depth.player, obj_character_sans, { sprite_index: spr_sans_sitting7 })
		}],
		[cutscene_dialog_async, episode + "Dialog8_Line1"],
		[cutscene_wait_by_dialog, 2],
		[cutscene_object_set_sprtie, sans, spr_sans_sitting2],
		// Memories in empty XTale universe
		[cutscene_wait_by_dialog, 4],
		[layer_background_sprite, background_id, spr_background_dream],
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
			cross.x += 30;
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
			cross.x += 250;
			cross.sprite_index = spr_cross_running_left_to_ink;
		}],
		[cutscene_character_move, ink_sans, -540, 0, 2],
		[cutscene_character_move, cross, -540, 0, 2],
		[cutscene_wait, 5],
		[cutscene_object_set_sprtie, ink_sans, spr_ink_sans_running_right_without_broomie],
		[cutscene_object_set_sprtie, cross, spr_cross_running_right_with_broomie],
		[cutscene_character_move, ink_sans, 540, 0, 2],
		[cutscene_character_move, cross, 540, 0, 2],
		[cutscene_wait, 4],
		[effect_fade, 1, 1, c_black, c_black, true, 0],
		[cutscene_wait, 1],
		// Ink and Cross are sitting
		[cutscene_execute, function () {
			instance_destroy(ink_sans);
			ink_sans = instance_create_depth(250, 167, fight_depth.player, obj_character_ink_sans, { sprite_index: spr_ink_sans_sitting1 });
			instance_destroy(cross);
			cross = instance_create_depth(270, 167, fight_depth.player, obj_character_cross, { sprite_index: spr_cross_left_sitting });
		}],
		[cutscene_wait, 1],
		[cutscene_dialog_async, episode + "Dialog9_Line1"],
	],
	[
		// Sans selected "No. Get lost"
		[cutscene_wait, 1],
		[cutscene_execute, function () { sans.sprite_index = spr_sans_sitting4; }],
		[cutscene_dialog_async, episode + "Dialog3_Line2"],
		[cutscene_execute_by_dialog, 2, function () { 
			sans.sprite_index = spr_sans_sitting3; 
		}],
		[cutscene_execute_by_dialog, 4, function () { 
			sans.sprite_index = spr_sans_sitting1; 
		}],
		[cutscene_wait_dialog_end],
		[cutscene_wait, 3],
		[cutscene_dialog, episode + "Dialog4_Line2"],
		[cutscene_wait, 1],
		[cutscene_execute, function () { 
			sans.sprite_index = spr_sans_sitting0; 
		}],
		[cutscene_wait, 2],
		[cutscene_dialog_async, episode + "Dialog5_Line2"],
		[cutscene_execute_by_dialog, 1, function () { 
			sans.sprite_index = spr_sans_sitting2; 
		}],
		[cutscene_wait_dialog_end],
		[cutscene_execute, function () {
			sans.sprite_index = spr_char_sans_walk_left;
			sans.speed = 2;
			sans.direction = 180;
		}],
		[effect_fade, 4, 1, c_black, c_black, true, 0]
	],
];