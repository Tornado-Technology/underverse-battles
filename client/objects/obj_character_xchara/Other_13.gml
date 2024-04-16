/// @description Story mode animations end

// Episode 1

change_sprite_to_other_sprite(spr_xchara_in_inks, spr_xchara_in_inks_angry);

if (sprite_index == spr_xchara_teleported)
	instance_destroy();
	
// Episode 2

change_sprite_to_other_sprite(spr_xchara_stand_up_on_knees, spr_xchara_on_knees);
change_sprite_to_other_sprite(spr_xchara_on_knees_transform_cross_1, spr_cross_left_on_knees_1);
change_sprite_to_other_sprite(spr_xchara_on_knees_transform_back, spr_xchara_on_knees_turns_back);
change_sprite_to_other_sprite(spr_xchara_on_knees_turns_back, spr_xchara_on_knees_turned_back);
change_sprite_to_other_sprite(spr_xchara_on_knees_turns_forward, spr_xchara_on_knees);

if (sprite_index == spr_xchara_on_knees_teleporting)
	instance_destroy();

// Episode 3

change_sprite_to_other_sprite(spr_xchara_on_knees_transform_cross_2, spr_cross_left_on_knees_2);
change_sprite_to_other_sprite(spr_xchara_on_knees_transform_cross_3, spr_cross_left_on_knees_3);
change_sprite_to_other_sprite(spr_cross_on_knees_turning_to_xchara, spr_xchara_on_knees_sad);