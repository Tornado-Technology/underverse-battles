audio_play_sound_plugging(snd_selection);
keyboard_clear_lastkey();
mouse_clear(mouse_lastbutton);
on_translate_update.disconnect(translate_update);

instance_create(obj_friends_selection);