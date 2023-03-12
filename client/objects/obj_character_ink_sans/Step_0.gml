event_inherited();

if (global.fight_instance == noone || player_num == -1)
	exit;

var player_action = fight_get_player_action(player_num);

if (sprite_index == spr_char_ink_sans_idle &&
	fight_get_initiative() == player_num &&
	fight_get_state() == fight_state.battle &&
	(player_action == 0 || player_action == 1))
	sprite_index = spr_char_ink_sans_attack1_start;

else if (sprite_index == spr_char_ink_sans_attack1_fight && fight_get_initiative() != player_num)
	sprite_index = spr_char_ink_sans_attack1_finish;
	
if (sprite_index == spr_char_ink_sans_idle &&
fight_get_initiative() == player_num &&
fight_get_state() == fight_state.battle &&
(player_action == 2))
sprite_index = spr_char_ink_sans_attack2_start;

else if (sprite_index == spr_char_ink_sans_attack2_fight && fight_get_initiative() != player_num)
	sprite_index = spr_char_ink_sans_attack2_finish;