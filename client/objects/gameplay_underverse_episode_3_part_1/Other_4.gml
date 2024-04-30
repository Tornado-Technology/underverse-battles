// Sounds
audio_stop_all();

// Characters create
xchara = instance_create_depth(223, 176, fight_depth.player, obj_character_xchara, {
	sprite_index: spr_xchara_on_knees_holds
});

// Effects
camera_set_overwrite_position(0, 0);
effect_fade(0, 0, 3, c_black, false, fight_depth.ui);

// First cutscene
cutscene_create(cutscenes[0]);