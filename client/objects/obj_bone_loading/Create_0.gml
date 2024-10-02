image_yscale = 2;
h = 5;

if (!variable_instance_exists(id, "match_mode")) match_mode = match_type.common_1vs1;

switch (match_mode) {
	case match_type.common_1vs1:
	case match_type.common_2vs2:
		sprite_index = spr_bone_spining_papyrus;
		break;
	case match_type.rating_1vs1:
	case match_type.rating_2vs2:
		sprite_index = spr_bone_rotating_swap_sans;
		break;
	case match_type.tournament_1vs1:
	case match_type.tournament_2vs2:
		sprite_index = spr_bone_spinning_fell_sans;
		break;
}