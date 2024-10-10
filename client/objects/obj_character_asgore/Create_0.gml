event_inherited();
// Base
name	    = translate_get("Character.Asgore.Name");
description = translate_get("Character.Asgore.Description");
bio			= translate_get("Character.Asgore.Bio");
universe	= "Undertale";
creator		= "Toby Fox";

// HP
max_hp = 200;
hp = 200;

// Damage
damage = 6;
invulnerability = true;

// Stamina
max_stamina = 100;
stamina = 100;
stamina_regen = 20;
action_stamina_cost = [10, 15, 20];

// Mana
mana = 50;
max_mana = 100;

// Soul
soul = spr_battle_soul;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_empty;

// Animations
idle_animation = spr_empty;
after_battle_animation = spr_empty;
defeated_animation = spr_empty;

// Actions
passive_skill = PassiveSkill("Character.ClassicSans.PassiveSkill");
actions = [
	Action("Character.ClassicSans.Attack0", char_sans_attack_0),
	Action("Character.ClassicSans.Attack1", char_sans_attack_1),
	Action("Character.ClassicSans.Attack2", char_sans_attack_2)
];
special_action = SpecialAction("Character.ClassicSans.SpecialAttack", spr_special_attack_sans, spr_special_attack_sans_locked, char_sans_special_attack);

// Soundtrack
soundtrack_name = "Asgore"; 
soundtrack = snd_asgore;