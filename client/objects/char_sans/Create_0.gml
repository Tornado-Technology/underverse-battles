event_inherited();
// Base
index = 2;
name	    = translate_get("Character.ClassicSans.Name");
description = translate_get("Character.ClassicSans.Description");
bio			= translate_get("Character.ClassicSans.Bio");
universe	= "Undertale";
creator		= "Toby Fox";

// HP
max_hp = 100;
hp = 100;

// Damage
damage = 1;
invulnerability = false;

// Stamina
max_stamina = 100;
stamina = 100;
stamina_regen = 20;
action_stamina_cost = [10, 15, 20];

// Mana
mana = 50;
max_mana = 100;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];

// Soul
soul = spr_battle_soul;

// Skin
skin_name = translate_get("CharactersStyles.Classic");
frame = spr_sans_frame;

// Animations
idle_animation = spr_char_sans_idle;
after_battle_animation = spr_sans_after_battle;
defeated_animation = spr_char_sans_defeated;

hand_up_animation = spr_char_sans_attack_2_up;
hand_down_up_animation = spr_char_sans_attack_2_down_up;
hand_left_up_animation = spr_char_sans_attack_2_left_up;
hand_right_up_animation = spr_char_sans_attack_2_right_up;
hand_down_animation = spr_char_sans_attack_2_down;
hand_up_down_animation = spr_char_sans_attack_2_up_down;
hand_left_down_animation = spr_char_sans_attack_2_left_down;
hand_right_down_animation = spr_char_sans_attack_2_right_down;
hand_left_animation = spr_char_sans_attack_2_left;
hand_up_left_animation = spr_char_sans_attack_2_up_left;
hand_down_left_animation = spr_char_sans_attack_2_down_left;
hand_right_left_animation = spr_char_sans_attack_2_right_left;
hand_right_animation = spr_char_sans_attack_2_right;
hand_up_right_animation = spr_char_sans_attack_2_up_right;
hand_down_right_animation = spr_char_sans_attack_2_down_right;
hand_left_right_animation = spr_char_sans_attack_2_left_right;

// Actions
passive_skill_name = translate_get("Character.ClassicSans.PassiveSkill.Name");
passive_skill_desc = translate_get("Character.ClassicSans.PassiveSkill.Description");
actions = [
	Action("Bones",fight_action_type.attack, char_sans_attack_0),
	Action("Gasterblasters", fight_action_type.attack, char_sans_attack_1),
	Action("BlueAttack", fight_action_type.attack, char_sans_attack_2)
];

// Special
hand_dir_previous = dir.left;
has_gravity_change = true;
gravity_attack_num = 2;
use_gravity_attack = true;

on_skipping = function(enemy_id) {
	fight_add_enemy_mana(enemy_id, 10);
}

change_sprite_hand_dir = function(hand_dir) {
	if (hand_dir_previous == dir.up && hand_dir == dir.up) sprite_index = hand_left_up_animation;
	if (hand_dir_previous == dir.down && hand_dir == dir.up) sprite_index = hand_down_up_animation;
	if (hand_dir_previous == dir.left && hand_dir == dir.up) sprite_index = hand_left_up_animation
	if (hand_dir_previous == dir.right && hand_dir == dir.up) sprite_index = hand_right_up_animation;
	if (hand_dir_previous == dir.up && hand_dir == dir.down) sprite_index = hand_up_down_animation;
	if (hand_dir_previous == dir.down && hand_dir == dir.down) sprite_index = hand_left_down_animation;
	if (hand_dir_previous == dir.left && hand_dir == dir.down) sprite_index = hand_left_down_animation;
	if (hand_dir_previous == dir.right && hand_dir == dir.down) sprite_index = hand_right_down_animation;
	if (hand_dir_previous == dir.up && hand_dir == dir.left) sprite_index = hand_up_left_animation;
	if (hand_dir_previous == dir.down && hand_dir == dir.left) sprite_index = hand_down_left_animation;
	if (hand_dir_previous == dir.left && hand_dir == dir.left) sprite_index = hand_left_animation;
	if (hand_dir_previous == dir.right && hand_dir == dir.left) sprite_index = hand_right_left_animation;
	if (hand_dir_previous == dir.up && hand_dir == dir.right) sprite_index = hand_up_right_animation;
	if (hand_dir_previous == dir.down && hand_dir == dir.right) sprite_index = hand_down_right_animation;
	if (hand_dir_previous == dir.left && hand_dir == dir.right) sprite_index = hand_left_right_animation;
	if (hand_dir_previous == dir.right && hand_dir == dir.right) sprite_index = hand_left_right_animation;
	hand_dir_previous = hand_dir;
}
stop_hand_wave = function() {
	sprite_index = idle_animation;
}

// Soundtrack
soundtrack_name = "Megalovania"; 
soundtrack = snd_megalovania;
#endregion