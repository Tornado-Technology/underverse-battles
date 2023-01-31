audio_sound_gain(playing_sound, data_get("Settings.Gain.Music"), 500);
audio_stop_all();
audio_play_sound(obj_menu.menu_soundtrack_current, 2, true, data_get("Settings.Gain.MenuMusic"));
audio_play_sound_plugging(snd_selection);
menu_switch_pause(false);
keyboard_clear_lastkey();
mouse_clear(mouse_lastbutton);
global.on_translate_update.disconnect(translate_update);
