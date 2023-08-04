event_inherited();
// Base
index = 9;
name	    = translate_get("Character.ClassicSans.Name");
description = translate_get("Character.ClassicSans.Description");
bio			= translate_get("Character.ClassicSans.Bio");
universe	= "Dreamtale";
creator		= "Joku";

// HP
max_hp = 120;
hp = 120;

// Damage
damage = 6;
invulnerability = true;

// Stamina
max_stamina = 120;
stamina = 120;
stamina_regen = 25;
action_stamina_cost = [10, 10, 20];

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

// Actions
passive_skill = PassiveSkill("Character.ClassicSans.PassiveSkill");
actions = [
	Action("Character.ClassicSans.Attack0", call_attack_dream_0),
	Action("Character.ClassicSans.Attack1", call_attack_dream_1),
	Action("Character.ClassicSans.Attack2", call_attack_dream_2)
];
special_action = SpecialAction("Character.ClassicSans.SpecialAttack", spr_special_attack_sans, spr_special_attack_sans_locked, call_attack_dream_special);

on_battle_end = function(damage) {
	if (damage == 0) {
		special_action.percent += 10;
		if (special_action.percent > 100) {
			special_action.percent = 100;
		}
	}
};

// Soundtrack
soundtrack_name = "Megalovania"; 
soundtrack = snd_megalovania;