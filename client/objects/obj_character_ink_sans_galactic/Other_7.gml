if (sprite_index == after_battle_animation)
	sprite_index = idle_animation;
change_sprite_to_other_sprite(fight_1_start_animation, fight_1_idle_animation);
change_sprite_to_other_sprite(fight_1_finish_animation, idle_animation);

if (sprite_index == defeated_animation)	{
	sprite_index = spr_empty;	
}
