/// @desc Checker

if (global.fight_instance == noone) exit;
if (global.fight_instance.story_mode) exit;

var parent = get_main_char(fight_get_player_obj(1));
var hp = fight_get_player_hp(1);
	
if (hp <= 0) {
	achievement_give(achievement_id.first_kill);
	
	switch (parent) {
		case obj_character_sans:
			achievement_give(achievement_id.defeat_sans);
			break;
				
		case obj_character_error_sans:
			achievement_give(achievement_id.defeat_error);
			break;
				
		case obj_character_ink_sans:
			achievement_give(achievement_id.defeat_ink);
			break;
			
		case obj_character_fell_sans:
			achievement_give(achievement_id.defeat_fell);
			break;
				
		case obj_character_swap_sans:
			achievement_give(achievement_id.defeat_swap);
			break;
				
		case obj_character_swap_papyrus:
			achievement_give(achievement_id.defeat_swap_papyrus);
			break;
		
		case obj_character_xchara:
			achievement_give(achievement_id.defeat_xchara);
			break;
		
		case obj_character_cross:
			achievement_give(achievement_id.defeat_cross);
			break;
		
		case obj_character_green:
			achievement_give(achievement_id.defeat_green);
			break;
	}
	
	var player = fight_get_player(0);
	if (player.total_damage == 0) {
		achievement_give(achievement_id.not_scratch);
	}
	
	if (player.total_heal > player.max_hp) {
		achievement_give(achievement_id.immortality);
	}
}
