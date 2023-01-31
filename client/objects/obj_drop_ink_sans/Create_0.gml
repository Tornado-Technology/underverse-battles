event_inherited();

time = 0;

damage = get_char_damage(char_ink_sans);

time_create_ink = 100;
time_create_ink_step = 0.2;
time_create_ink_max = 100;

color_num = irandom_range(0, 1);
if (color_num == 1)
	sprite_index = spr_drop_red_ink_sans;
