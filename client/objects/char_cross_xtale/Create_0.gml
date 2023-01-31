event_inherited();
// Base
index = 7;
name	    = translate_get("Character.Cross.Name");
description = translate_get("Character.Cross.Description");
bio			= translate_get("Character.Cross.Bio");
universe	= "XTale";
creator		= "Jakei";

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
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_cross_frame;

// Animations
idle_animation = spr_cross_idle;
after_battle_animation = spr_cross_after_battle;
defeated_animation = spr_cross_idle;

hand_up_animation = spr_cross_attack_2_up;
hand_down_up_animation = spr_cross_attack_2_down_up;
hand_left_up_animation = spr_cross_attack_2_left_up;
hand_right_up_animation = spr_cross_attack_2_right_up;
hand_down_animation = spr_cross_attack_2_down;
hand_up_down_animation = spr_cross_attack_2_up_down;
hand_left_down_animation = spr_cross_attack_2_left_down;
hand_right_down_animation = spr_cross_attack_2_right_down;
hand_left_animation = spr_cross_attack_2_left;
hand_up_left_animation = spr_cross_attack_2_up_left;
hand_down_left_animation = spr_cross_attack_2_down_left;
hand_right_left_animation = spr_cross_attack_2_right_left;
hand_right_animation = spr_cross_attack_2_right;
hand_up_right_animation = spr_cross_attack_2_up_right;
hand_down_right_animation = spr_cross_attack_2_down_right;
hand_left_right_animation = spr_cross_attack_2_left_right;

// Actions
passive_skill_name = translate_get("Character.Cross.PassiveSkill.Name");
passive_skill_desc = translate_get("Character.Cross.PassiveSkill.Description");
actions = [
	Action("Bones", fight_action_type.attack, cross_attack0),
	Action("Gasterblasters", fight_action_type.attack, cross_attack1),
	Action("BlueAttack", fight_action_type.attack, cross_attack2)
];

// Special
has_gravity_change = true;
gravity_attack_num = 2;
use_gravity_attack = true;

// Soundtrack
soundtrack_name = "Cross Theme"; 
soundtrack = snd_cross_theme;