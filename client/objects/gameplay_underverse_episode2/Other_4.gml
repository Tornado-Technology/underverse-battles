// Эффект затемнения
effect_fade(0, 3, c_black, c_black, true, 0);

// Звуки
audio_stop_all();
// Добавить эмбиент леса

// Создание персонажей
sans = instance_create_depth(223, 197, fight_depth.player, obj_character_sans, {
	sprite_index: spr_sans_sitting0
});

ink_sans = instance_create_depth(255, 197, fight_depth.player, obj_character_ink_sans, {
	sprite_index: spr_ink_sans_sitting0
});

// Запуск первой катсцены
cutscene_create(cutscenes[0]);