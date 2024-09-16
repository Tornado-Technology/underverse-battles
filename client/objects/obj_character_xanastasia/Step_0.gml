event_inherited();

if (global.fight_instance == noone || player_num == -1)
	exit;

var player_action = fight_get_player_attack(player_num);
	
if (sprite_index == idle_animation && fight_get_initiative() == player_num && 
	fight_get_state() == fight_state.battle && (player_action == 1))
	sprite_index = fight_1_start_animation;
else if (sprite_index == fight_1_idle_animation && fight_get_initiative() != player_num)
	sprite_index = fight_1_finish_animation;
	
if (sprite_index == idle_animation && fight_get_initiative() == player_num &&
	fight_get_state() == fight_state.battle && (player_action == 2))
	sprite_index = fight_2_start_animation;
else if (sprite_index == fight_2_idle_animation && fight_get_initiative() != player_num)
	sprite_index = fight_2_finish_animation;