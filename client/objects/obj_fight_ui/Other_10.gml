/// @desc Line Step
var player_hp_line = [];
var player_stamina_line = [];
var player_mana_line = [];

var player_id = 0; repeat (2) {
	player_hp_line[player_id] = option_bar_width[0] / fight_get_player_max_hp(player_id) * fight_get_player_hp(player_id);
	player_stamina_line[player_id] =  option_bar_width[1] / fight_get_player_max_stamina(player_id) * fight_get_player_stamina(player_id);
	player_mana_line[player_id] =  option_bar_width[2] / fight_get_player_max_mana(player_id) * fight_get_player_mana(player_id);
	
	player_id++;
}

var bar_id = 0; repeat (3) {
	option_bar_width[bar_id]  = sprite_get_width(option_bar_sprites[bar_id]);
	option_bar_height[bar_id] = sprite_get_height(option_bar_sprites[bar_id]);
	
	bar_id++;
}

current_hp_line[0] = lerp(current_hp_line[0], player_hp_line[0], 0.2);
current_hp_line[1] = lerp(current_hp_line[1], player_hp_line[1], 0.2);
current_mana_line[0] = lerp(current_mana_line[0], player_mana_line[0], 0.2);
current_mana_line[1] = lerp(current_mana_line[1], player_mana_line[1], 0.2);
current_stamina_line[0] = lerp(current_stamina_line[0], player_stamina_line[0], 0.2);
current_stamina_line[1] = lerp(current_stamina_line[1], player_stamina_line[1], 0.2);
