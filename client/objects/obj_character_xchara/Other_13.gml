/// @description Story mode animations end

// Episode 1

if (sprite_index == spr_xchara_in_inks)
	sprite_index = spr_xchara_in_inks_angry;

if (sprite_index == spr_xchara_teleported)
	instance_destroy();
	
// Episode 2

if (sprite_index == spr_xchara_stand_up_on_knees)
	sprite_index = spr_xchara_on_knees;

if (sprite_index == spr_xchara_on_knees_transform_cross)
	sprite_index = spr_xchara_on_knees_cross;

if (sprite_index == spr_xchara_on_knees_transform_back)
	sprite_index = spr_xchara_on_knees_turns_back;

if (sprite_index == spr_xchara_on_knees_turns_back)
	sprite_index = spr_xchara_on_knees_turned_back;

if (sprite_index == spr_xchara_on_knees_turns_forward)
	sprite_index = spr_xchara_on_knees;

if (sprite_index == spr_xchara_on_knees_teleporting)
	instance_destroy();