audio_play_sound_plugging(snd_selection);
if (is_return_to_menu) menu_switch_pause(false);
keyboard_clear_lastkey();
mouse_clear(mouse_lastbutton);
on_translate_update.disconnect(translate_update);