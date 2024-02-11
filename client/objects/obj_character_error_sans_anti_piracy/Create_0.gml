event_inherited();

// Soul
soul = spr_soul_error_anti_piracy;

//Skin
skin_name = translate_get("CharactersStyles.AntiPiracy");
frame = spr_error_sans_anti_piracy_frame;

// Animations
idle_animation = spr_error_sans_anti_piracy_idle;
after_battle_animation = spr_error_sans_anti_piracy_idle;
defeated_animation = spr_error_sans_anti_piracy_defeated;
defeated_animation_last_image = spr_error_sans_anti_piracy_defeated_last_image;
start1_animation = spr_error_sans_anti_piracy_attack_1_start;
fight1_animation = spr_error_sans_anti_piracy_attack_1_idle;
end1_animation = spr_error_sans_anti_piracy_attack_1_finish;

if (irandom(5) == 5) {
	defeated_animation = spr_error_sans_anti_piracy_defeated_explosion;
	defeated_animation_last_image = spr_empty;
}

// Actions
actions = [
	Action("Character.ErrorSans.Attack0", error_sans_anti_piracy_attack0),
	Action("Character.ErrorSans.Attack1", error_sans_anti_piracy_attack1),
	Action("Character.ErrorSans.Attack2", error_sans_anti_piracy_attack2)
];
special_action = SpecialAction("Character.ErrorSans.SpecialAttack", spr_special_attack_error_sans, spr_special_attack_error_sans_locked, error_sans_anti_piracy_special_attack);