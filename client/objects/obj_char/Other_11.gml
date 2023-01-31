/// @desc After battle
if (global.fight_instance == noone || player_num == -1)
	exit;

if (sprite_index == idle_animation && fight_get_state() == fight_state.choosing && play_animation_after_battle) {
	var rand_num = irandom_range(1, 5);
	if (rand_num == 5) {
		sprite_index = after_battle_animation;
	}
	play_animation_after_battle = false;
}
else if (!play_animation_after_battle && fight_get_state() == fight_state.battle) {
	play_animation_after_battle = true;
}