event_inherited();

universe	= "Underpants";
creator		= "Sr Pelo";

// Skins
skin_name = translate_get("CharactersStyles.Saness");
frame = spr_sans_saness_frame;

// Animations
idle_animation = spr_sans_saness_idle;
after_battle_animation = spr_sans_saness_idle;
defeated_animation = spr_sans_saness_defeated;

hand_up_animation = spr_sans_saness_attack_2_up;
hand_down_up_animation = spr_sans_saness_attack_2_down_up;
hand_left_up_animation = spr_sans_saness_attack_2_left_up;
hand_right_up_animation = spr_sans_saness_attack_2_right_up;
hand_down_animation = spr_sans_saness_attack_2_down;
hand_up_down_animation = spr_sans_saness_attack_2_up_down;
hand_left_down_animation = spr_sans_saness_attack_2_left_down;
hand_right_down_animation = spr_sans_saness_attack_2_right_down;
hand_left_animation =spr_sans_saness_attack_2_left;
hand_up_left_animation = spr_sans_saness_attack_2_up_left;
hand_down_left_animation = spr_sans_saness_attack_2_down_left;
hand_right_left_animation = spr_sans_saness_attack_2_right_left;
hand_right_animation = spr_sans_saness_attack_2_right;
hand_up_right_animation = spr_sans_saness_attack_2_up_right;
hand_down_right_animation = spr_sans_saness_attack_2_down_right;
hand_left_right_animation = spr_sans_saness_attack_2_left_right;

// Actions
passive_skill = PassiveSkill("Character.ClassicSans.PassiveSkill");
actions = [
	Action("Character.ClassicSans.Attack0", char_sans_attack_0),
	Action("Character.ClassicSans.Attack1", char_saness_attack_1),
	Action("Character.ClassicSans.Attack2", char_sans_attack_2)
];
special_action = SpecialAction("Character.ClassicSans.SpecialAttack", spr_special_attack_saness, spr_special_attack_saness_locked, char_saness_special_attack);