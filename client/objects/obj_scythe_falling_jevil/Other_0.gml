var blast = instance_create_depth(x, y, fight_depth.bullet_outside_hight, obj_blast_jevil);
blast._angle = angle_blast;

audio_play_sound_plugging(snd_bomb);

instance_destroy();