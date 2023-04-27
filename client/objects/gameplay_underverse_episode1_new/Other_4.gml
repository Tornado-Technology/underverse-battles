// Звуки
audio_stop_all();
audio_play_sound(snd_dark_dream, 1, true);

// Создание персонажей
sans = instance_create_depth(240, room_height / 2, fight_depth.player, player_sans);
xchara = instance_create_depth(1000, room_height / 2, fight_depth.player, obj_character_xchara, {
	sprite_index: spr_xchara_secretive
});

// Создание объектов
room_width = 1280;
wall_left = instance_create_depth(0, 0, 0, obj_wall);
wall_left.image_yscale = room_height / wall_left.sprite_height;
wall_right = instance_create_depth(room_width - sprite_get_width(obj_wall), 0, 0, obj_wall);
wall_right.image_yscale = room_height / wall_left.sprite_height;

// Эффекты
camera_set_zoom(8);
camera_set_taget(sans);

var start_time_sec = 3;
effect_fade(0, start_time_sec, c_black, c_black, true, 0);
camera_change_zoom(4, start_time_sec);

// Запуск первой катсцены
cutscene_create(cutscenes[0]);