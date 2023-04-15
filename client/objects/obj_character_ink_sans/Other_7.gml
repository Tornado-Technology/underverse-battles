event_inherited();

if (sprite_index == spr_char_ink_sans_attack1_start)
	sprite_index = spr_char_ink_sans_attack1_fight;
if (sprite_index == spr_char_ink_sans_attack1_finish)
	sprite_index = spr_char_ink_sans_idle;
	
if (sprite_index == spr_char_ink_sans_attack2_start)
	sprite_index = spr_char_ink_sans_attack2_fight;
if (sprite_index == spr_char_ink_sans_attack2_finish)
	sprite_index = spr_char_ink_sans_idle;
	
event_user(3);