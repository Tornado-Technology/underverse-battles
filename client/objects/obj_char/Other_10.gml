/// @desc Defeated
if (global.fight_instance == noone) exit;
if (global.fight_instance.story_mode) exit;
if (hp <= 0) {
	sprite_index = defeated_animation;
}
