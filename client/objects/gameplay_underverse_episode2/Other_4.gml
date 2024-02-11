// Sounds
audio_stop_all();
// Добавить эмбиент леса

// Characters create
sans = instance_create_depth(223, 197, fight_depth.player, obj_character_sans, {
	sprite_index: spr_sans_sitting0
});

ink_sans = instance_create_depth(255, 197, fight_depth.player, obj_character_ink_sans, {
	sprite_index: spr_ink_sans_sitting0
});

// Effects
camera_set_overwrite_position(0, 0);
effect_fade(0, 3, c_black, c_black, false, fight_depth.ui);

// First cutscene
cutscene_create(cutscenes[0]);