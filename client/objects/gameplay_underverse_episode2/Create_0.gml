on_into_story_mode.invoke("Tutorial");

episode = "Underverse_Episode2."; // Приставка для названия диалога

// Персонажи
ink_sans = noone;
sans = noone;

// Фон
var layer_background_current = layer_get_id("Background");
var background_id = layer_background_get_id(layer_background_current);

// Катсцены
cutscenes = [
	[
		[cutscene_wait, 4],
		[cutscene_dialog, episode + "Dialog1"],
		[cutscene_wait, 3],
		[cutscene_execute, function () { ink_sans.sprite_index = spr_ink_sans_sitting2; }],
		[cutscene_wait, 1],
		[cutscene_execute, function () { ink_sans.sprite_index = spr_ink_sans_sitting1; }],
		[cutscene_dialog_async, episode + "Dialog2"],
		[cutscene_execute_by_dialog, 1, function () { sans.sprite_index = spr_sans_sitting1; }],
		[cutscene_execute_by_dialog, 3, function () { sans.sprite_index = spr_sans_sitting2; }],
		[cutscene_wait_dialog_end],
		[cutscene_execute, function () { ink_sans.sprite_index = spr_ink_sans_sitting3; }],
		[cutscene_execute, function () { sans.sprite_index = spr_sans_sitting3; }],
		[cutscene_choise, episode + "Choise1", function (index) { cutscene_create(cutscenes[index + 1]); }]
	],
	[
		// Санс выбрал "слушать"
		[cutscene_wait, 1],
		[cutscene_execute, function () {
			ink_sans.sprite_index = spr_ink_sans_sitting1; 
		}],
		[cutscene_execute, function () { 
			sans.sprite_index = spr_sans_sitting2; 
		}],
		[cutscene_wait, 1],
		[cutscene_dialog, episode + "Dialog3_1"],
		[cutscene_execute, function () { ink_sans.sprite_index = spr_ink_sans_pukes; }],
		[cutscene_execute, function () { sans.sprite_index = spr_sans_sitting5; }],
		[cutscene_wait, 3],
		[cutscene_execute, function () { ink_sans.sprite_index = spr_char_ink_sans_sitting_joyful; }],
		[cutscene_execute, function () { sans.sprite_index = spr_sans_sitting6; }],
		[cutscene_dialog_async, episode + "Dialog4_1"],
		[cutscene_execute_by_dialog, 1, function () { ink_sans.sprite_index = spr_char_ink_sans_apologetic; }],
		[cutscene_wait_dialog_end],
		[effect_fade, 4, 1, c_white, c_white, true, 0],
		[cutscene_wait, 4],
		[cutscene_execute, function () { audio_play_sound(snd_into_clear_void, 2, true); }],
		[cutscene_execute, function () { instance_destroy(sans); ink_sans.x -= 20; ink_sans.y -= 50; ink_sans.sprite_index = spr_ink_sans_flying_painting; }],
		[layer_background_sprite, background_id, spr_background_doodle_sphere],
		[cutscene_wait, 1],
		[cutscene_dialog_async, episode + "Dialog5_1"]
	],
	[
		// Санс выбрал "нет. проваливай"
		[cutscene_wait, 1],
		[cutscene_execute, function () { sans.sprite_index = spr_sans_sitting4; }],
		[cutscene_dialog_async, episode + "Dialog3_2"],
		[cutscene_execute_by_dialog, 2, function () { 
			sans.sprite_index = spr_sans_sitting3; 
		}],
		[cutscene_execute_by_dialog, 4, function () { 
			sans.sprite_index = spr_sans_sitting1; 
		}],
		[cutscene_wait_dialog_end],
		[cutscene_wait, 3],
		[cutscene_dialog, episode + "Dialog4_2"],
		[cutscene_wait, 1],
		[cutscene_execute, function () { 
			sans.sprite_index = spr_sans_sitting0; 
		}],
		[cutscene_wait, 2],
		[cutscene_dialog_async, episode + "Dialog5_2"],
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