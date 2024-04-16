event_inherited();

if (sprite_index == fight_0_start_animation)
	sprite_index = fight_0_idle_animation;
if (sprite_index == fight_0_finish_animation)
	sprite_index = idle_animation;
	
if (sprite_index == fight_1_start_animation)
	sprite_index = fight_1_idle_animation;
if (sprite_index == fight_1_finish_animation)
	sprite_index = idle_animation;

if (sprite_index == fight_2_start_animation)
	sprite_index = fight_2_idle_animation;
if (sprite_index == fight_2_finish_animation)
	sprite_index = idle_animation;
	
event_user(3);