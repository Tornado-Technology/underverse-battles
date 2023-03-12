event_inherited();

if (sprite_index == start2_animation)
	sprite_index = fight2_animation;
if (sprite_index == end2_animation)
	sprite_index = idle_animation;

if (sprite_index == spr_xchara_in_inks)
	sprite_index = spr_xchara_in_inks_angry;
if (sprite_index == spr_xchara_teleported)
	instance_destroy();