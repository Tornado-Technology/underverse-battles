event_inherited();

if (global.fight_instance == noone || player_num == -1)
	exit;

var player_action = fight_get_player_action(player_num);

if (sprite_index == idle_animation && fight_get_initiative() == player_num && 
	fight_get_state() == fight_state.battle && (player_action == fight_action_type.attack_1))
	sprite_index = fight_1_start_animation;
else if (sprite_index == fight_1_idle_animation && fight_get_initiative() != player_num)
	sprite_index = fight_1_finish_animation;
	
if (transition_animation) {	
	if (sprite_index == idle_animation && fight_get_initiative() == player_num && 
		fight_get_state() == fight_state.battle && (player_action == fight_action_type.special_attack))
		sprite_index = special_attack_start_animation;
	else if (sprite_index == special_attack_idle_animation && fight_get_initiative() != player_num)
		sprite_index = special_attack_finish_animation;
}