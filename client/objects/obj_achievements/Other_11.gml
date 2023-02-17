/// @desc Checker
#region Fight
if (global.fight_instance == noone) exit;
if (global.fight_instance.story_mode) exit;
var parent = get_main_char(fight_get_enemy_obj(1));
var hp = fight_get_enemy_hp(1);
	
if (hp <= 0) {
	achievement_give(achievement_id.first_kill);
	
	switch (parent) {
		case obj_char_sans:
			achievement_give(achievement_id.defeat_sans);
			break;
				
		case obj_char_error_sans:
			achievement_give(achievement_id.defeat_error);
			break;
				
		case obj_char_ink_sans:
			achievement_give(achievement_id.defeat_ink);
			break;
			
		case obj_char_fell_sans:
			achievement_give(achievement_id.defeat_fell);
			break;
				
		case obj_char_swap_sans:
			achievement_give(achievement_id.defeat_swap);
			break;
				
		case obj_char_swap_papyrus:
			achievement_give(achievement_id.defeat_swap_papyrus);
			break;
		
		case obj_char_xchara_uv00:
			achievement_give(achievement_id.defeat_xchara);
			break;
	}
}
#endregion