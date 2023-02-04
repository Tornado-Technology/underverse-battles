event_inherited();

if (global.fight_instance == noone || player_num == -1)
	exit;

var player_action = fight_get_enemy_action(player_num);

if (sprite_index == spr_swap_sans_idle &&
	fight_get_initiative() == player_num &&
	fight_get_state() == fight_state.battle &&
	(player_action == 0 || player_action == 1))
	sprite_index = spr_swap_sans_start0;

else if (sprite_index == spr_swap_sans_fight0 && fight_get_initiative() != player_num)
	sprite_index = spr_swap_sans_end0;