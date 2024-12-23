// Inherit the parent event
event_inherited();

skin_name = translate_get("CharactersStyles.Harlequin");
frame = spr_jevil_harlequin_frame;

// Animations
idle_animation = spr_jevil_harlequin_idle;
after_battle_animation = spr_jevil_harlequin_idle;
defeated_animation =  spr_jevil_harlequin_defeated;

dancing_animation = spr_jevil_harlequin_dancing;

fight_2_start_animation = spr_jevil_harlequin_scythe_start;
fight_2_idle_animation = spr_jevil_harlequin_scythe_idle;
fight_2_finish_animation = spr_jevil_harlequin_scythe_finish;

actions = [
	Action("Character.Jevil.Attack0", jevil_attack0),
	Action("Character.Jevil.Attack1", jevil_harlequin_attack1),
	Action("Character.Jevil.Attack2", jevil_attack2)
];

special_action = SpecialAction("Character.Jevil.SpecialAttack", spr_special_attack_jevil, spr_special_attack_jevil_locked, jevil_harlequin_special_attack);