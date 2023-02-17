room_width = 1280;

player_ = instance_create_depth(240, room_height / 2, fight_depth.enemy, player_sans);
xchara_ = instance_create_depth(1000, room_height / 2, fight_depth.enemy, obj_char_xchara_uv00);
xchara_.sprite_index = spr_xchara_secretive;

wall_left = instance_create_depth(0, 0, 0, obj_wall);
wall_left.image_yscale = room_height / wall_left.sprite_height;
wall_right = instance_create_depth(room_width - sprite_get_width(obj_wall), 0, 0, obj_wall);
wall_right.image_yscale = room_height / wall_left.sprite_height;

camera_set_zoom(8);
camera_set_taget(player_);

var start_time_sec = 3;
effect_fade(0, start_time_sec, c_black, c_black, true, 0);
camera_change_zoom(4, start_time_sec);

audio_stop_all();
audio_play_sound(snd_dark_dream, 1, true);

alarm[3] = convert_seconds_to_steps(start_time_sec);