room_width = 1280;

player_ = instance_create_depth(240, room_height / 2, fight_depth.player, obj_character_sans);
xchara_ = instance_create_depth(1000, room_height / 2, fight_depth.player, obj_character_xchara);
xchara_.sprite_index = spr_xchara_secretive;

wall_left = instance_create_depth(0, 0, 0, obj_wall);
wall_left.image_yscale = room_height / wall_left.sprite_height;
wall_right = instance_create_depth(room_width - sprite_get_width(spr_wall), 0, 0, obj_wall);
wall_right.image_yscale = room_height / wall_left.sprite_height;

camera_set_object_target(player_);
camera_set_target(player_.x, room_height / 2);
camera_set_zoom(2);

var start_time_sec = 3;
effect_fade(0, 0, start_time_sec, c_black, true);
camera_change_zoom(1, start_time_sec);

audio_stop_all();
audio_play_soundtrack(snd_dark_dream);

alarm[3] = convert_seconds_to_steps(start_time_sec);