event_inherited();

if (sprite_index == defeated_animation)
	sprite_index = defeated_animation_last_image;

if (sprite_index == fight_1_start_animation)
	sprite_index = fight_1_idle_animation;
if (sprite_index == fight_1_finish_animation)
	sprite_index = idle_animation;
	
if (transition_animation) {	
	if (sprite_index == special_attack_start_animation)
		sprite_index = special_attack_idle_animation;
	if (sprite_index == special_attack_finish_animation)
		sprite_index = idle_animation;
}
event_user(3);