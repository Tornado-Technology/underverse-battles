event_inherited();

// Skin
skin_name = translate_get("CharactersStyles.IceBlood");
frame = spr_ink_sans_ice_blood_frame;

// Animations
idle_animation = spr_ink_sans_ice_blood_idle;
after_battle_animation = idle_animation;
defeated_animation = spr_ink_sans_ice_blood_defeated;
fight_1_start_animation = spr_ink_sans_ice_blood_broomie_start;
fight_1_idle_animation = spr_ink_sans_ice_blood_broomie_idle;
fight_1_finish_animation = spr_ink_sans_ice_blood_broomie_finish;

fight_2_start_animation = spr_ink_sans_ice_blood_gb_start;
fight_2_idle_animation = spr_ink_sans_ice_blood_gb_idle;
fight_2_finish_animation = spr_ink_sans_ice_blood_gb_finish;

actions = [
	Action("Character.InkSans.Attack0", ink_sans_attack0),
	Action("Character.InkSans.Attack1", ink_sans_ice_blood_attack1),
	Action("Character.InkSans.Attack2", ink_sans_ice_blood_attack2)
];

special_action = SpecialAction("Character.InkSans.SpecialAttack", spr_special_attack_ink_sans, spr_special_attack_ink_sans_locked, ink_sans_ice_blood_special_attack);
