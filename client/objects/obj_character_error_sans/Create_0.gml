event_inherited();
// Base
index = 1;
name	    = translate_get("Character.ErrorSans.Name");
description = translate_get("Character.ErrorSans.Description");
bio			= translate_get("Character.ErrorSans.Bio");
universe	= "Errortale";
creator		= "Crayon Queen";

// HP
max_hp	= 100;
hp		= 100;

// Damage
damage	= 1;
invulnerability = false;

// Stamina
max_stamina = 100;
stamina		= 100;
stamina_regen = 20;
action_stamina_cost = [10, 15, 20];

// Mana
mana	 = 50;
max_mana = 100;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];

// Soul
soul = spr_battle_soul;

// Skin
skin_name = translate_get("CharactersStyles.Classic");
frame = spr_error_sans_frame;

// Animations
idle_animation = spr_error_sans_idle;
after_battle_animation = spr_error_sans_idle;
defeated_animation = spr_error_sans_defeated;
start1_animation = spr_error_sans_start1;
fight1_animation = spr_error_sans_fight1;
end1_animation = spr_error_sans_end1;

// Actions
passive_skill = PassiveSkill("Character.ErrorSans.PassiveSkill");
actions = [
	Action("Character.ErrorSans.Attack0", error_sans_attack0),
	Action("Character.ErrorSans.Attack1", error_sans_attack1),
	Action("Character.ErrorSans.Attack2", error_sans_attack2)
];
special_action = SpecialAction("Character.ErrorSans.SpecialAttack", spr_special_attack_error_sans, spr_special_attack_error_sans_locked, error_sans_special_attack);

// Special
on_taking_damage = function(damage) {
	if (damage > 1)
		return damage;
	
	var rand_num = irandom_range(1, 100);
	if (rand_num <= 6)
		return 0;
	return damage;
}

// Dev
play_animation_after_battle = false;

// Soundtrack
soundtrack_name = "Mismatch"; 
soundtrack = snd_mismatch;