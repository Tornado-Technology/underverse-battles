/// @desc Line Step
var enemy_hp_line = [];
var enemy_stamina_line = [];
var enemy_mana_line = [];

var enemy_id = 0; repeat (2) {
	enemy_hp_line[enemy_id] = option_bar_width[0] / fight_get_enemy_max_hp(enemy_id) * fight_get_enemy_hp(enemy_id);
	enemy_stamina_line[enemy_id] =  option_bar_width[1] / fight_get_enemy_max_stamina(enemy_id) * fight_get_enemy_stamina(enemy_id);
	enemy_mana_line[enemy_id] =  option_bar_width[2] / fight_get_enemy_max_mana(enemy_id) * fight_get_enemy_mana(enemy_id);
	
	enemy_id++;
}

var bar_id = 0; repeat (3) {
	option_bar_width[bar_id]  = sprite_get_width(option_bar_sprites[bar_id]);
	option_bar_height[bar_id] = sprite_get_height(option_bar_sprites[bar_id]);
	
	bar_id++;
}

current_hp_line[0] = lerp(current_hp_line[0], enemy_hp_line[0], 0.2);
current_hp_line[1] = lerp(current_hp_line[1], enemy_hp_line[1], 0.2);
current_mana_line[0] = lerp(current_mana_line[0], enemy_mana_line[0], 0.2);
current_mana_line[1] = lerp(current_mana_line[1], enemy_mana_line[1], 0.2);
current_stamina_line[0] = lerp(current_stamina_line[0], enemy_stamina_line[0], 0.2);
current_stamina_line[1] = lerp(current_stamina_line[1], enemy_stamina_line[1], 0.2);
