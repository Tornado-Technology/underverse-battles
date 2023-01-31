for (var i = 0; i < 2; i++) {
	current_hp_line[i] = fight_get_enemy_hp(i) / fight_get_enemy_max_hp(i);
	current_mana_line[i] = fight_get_enemy_mana(i) / fight_get_enemy_max_mana(i);
	current_stamina_line[i] = fight_get_enemy_stamina(i) / fight_get_enemy_max_stamina(i);
}

for (var i = 0; i < 3; i++) {
	var name = fight_get_action_name(0, i);
	text_name_actions_width[i] = string_width(name);
	text_name_actions_height[i] = string_height(name);
}