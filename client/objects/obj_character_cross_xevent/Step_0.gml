event_inherited();

if (global.fight_instance == noone || player_num == -1)
	exit;

var player_action = fight_get_player_attack(player_num);

if (sprite_index == idle_animation &&
	fight_get_initiative() == player_num &&
	fight_get_state() == fight_state.battle &&
	(player_action == 1))
	sprite_index = start1_animation;

else if (sprite_index == fight1_animation && fight_get_initiative() != player_num)
	sprite_index = end1_animation;