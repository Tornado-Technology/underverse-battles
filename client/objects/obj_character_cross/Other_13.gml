/// @description Story mode animations end
switch (sprite_index) {
	case spr_cross_sitting_crying_turns_around:
		sprite_index = spr_cross_sitting_crying_looking_back
		break;
		
	case spr_cross_sitting_crying_turns_back:
		sprite_index = spr_cross_sitting_crying_looks_at_ink_sans;
		break;
		
	case spr_cross_sitting_wipes_away_tears:
		sprite_index = spr_cross_sitting_down_crying_1;
		break;
		
	case spr_cross_left_gets_up:
		sprite_index = spr_cross_left_getting_up;
		break;
		
	case spr_cross_left_turns_around:
		sprite_index = spr_cross_left_turned_around;
		break;
}
