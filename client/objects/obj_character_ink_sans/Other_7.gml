event_inherited();

if (sprite_index == spr_char_ink_sans_start1)
	sprite_index = spr_char_ink_sans_fight1;
if (sprite_index == spr_char_ink_sans_end1)
	sprite_index = spr_char_ink_sans_idle;
	
if (sprite_index == spr_char_ink_sans_start2)
	sprite_index = spr_char_ink_sans_fight2;
if (sprite_index == spr_char_ink_sans_end2)
	sprite_index = spr_char_ink_sans_idle;
	
event_user(3);