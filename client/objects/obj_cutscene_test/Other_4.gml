// Sounds
audio_stop_all();

// Effects
camera_set_overwrite_position(0, 0);
effect_fade(0, 0, 3, c_black, false, fight_depth.ui);

// First cutscene
cutscene_create(cutscenes[0]);