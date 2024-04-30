// Sounds
audio_stop_all();
audio_play_sound(snd_surface, 2, true);

// Characters create
frisk = instance_create_depth(420, 2884, fight_depth.player, obj_character_frisk, {
	sprite_index: spr_frisk_with_plate
});
sans = instance_create_depth(543, 2912, fight_depth.player, obj_character_sans, {
	sprite_index: spr_sans_sitting_eating
});
papyrus = instance_create_depth(472, 2902, fight_depth.player, obj_character_papyrus, {
	sprite_index: spr_papyrus_picnic_sitting_eating
});
undyne = instance_create_depth(486, 2880, fight_depth.player, obj_character_undyne, {
	sprite_index: spr_undyne_picnic_eating_closed_eyes
});
alphys = instance_create_depth(512, 2882, fight_depth.player, obj_character_alphys, {
	sprite_index: spr_alphys_picnic_sitting_eating
});
toriel = instance_create_depth(543, 2894, fight_depth.player, obj_character_toriel, {
	sprite_index: spr_toriel_picnic_sitting_eating
});
asgore = instance_create_depth(367, 2880, fight_depth.player, obj_character_asgore, {
	sprite_index: spr_asgore_picnic_cooking
});

// Effects
camera_set_taget(frisk);
effect_fade(0, 0.1, 2, c_black, true, fight_depth.ui);

// First cutscene
cutscene_create(cutscenes[0]);