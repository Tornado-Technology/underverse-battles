for (var i = 0; i < 2; i++) {
	current_hp_line[i] = fight_get_player_hp(i) / fight_get_player_max_hp(i);
	current_mana_line[i] = fight_get_player_mana(i) / fight_get_player_max_mana(i);
	current_stamina_line[i] = fight_get_player_stamina(i) / fight_get_player_max_stamina(i);
}

for (var i = 0; i < 3; i++) {
	var name = fight_get_action_name(0, i);
	text_name_actions_width[i] = string_width(name);
	text_name_actions_height[i] = string_height(name);
}

special_button.set_image(fight_check_player_special_action_readiness(0) ?
	fight_get_player_special_action_icon(0) : fight_get_player_special_action_icon(0, true)
);