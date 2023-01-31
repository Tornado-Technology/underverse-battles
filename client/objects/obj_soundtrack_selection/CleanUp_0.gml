audio_stop_all();
audio_play_sound(obj_menu.menu_soundtrack_current, 2, true, 0.5);
audio_play_sound_plugging(snd_selection);
menu_switch_pause(false);
keyboard_clear_lastkey();
mouse_clear(mouse_lastbutton);
on_translate_update.disconnect(translate_update);