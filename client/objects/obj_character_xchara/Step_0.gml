event_inherited();

if (global.fight_instance == noone || player_num == -1)
	exit;

var player_action = fight_get_player_attack(player_num);

if (sprite_index == idle_animation &&
	fight_get_initiative() == player_num &&
	fight_get_state() == fight_state.battle &&
	(player_action == 2))
	sprite_index = start2_animation;

else if (sprite_index == fight2_animation && fight_get_initiative() != player_num)
	sprite_index = end2_animation;