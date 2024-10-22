// Sounds
audio_stop_all();

// Effects
camera_set_overwrite_position(0, 0);
effect_fade(0, 0, 3, c_black);

// First cutscene
create_destroying_soul(function () {});
//cutscene_create(cutscenes[0]);