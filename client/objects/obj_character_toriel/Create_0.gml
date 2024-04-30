event_inherited();
// Base
index = 2;
name	    = translate_get("Character.Toriel.Name");
description = translate_get("Character.Toriel.Description");
bio			= translate_get("Character.Toriel.Bio");
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
action_mana_upgrade_cost = [0, 10, 25, 40, 60];

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
passive_skill = PassiveSkill("Character.Toriel.PassiveSkill");
actions = [
	Action("Character.Toriel.Attack0", char_sans_attack_0),
	Action("Character.Toriel.Attack1", char_sans_attack_1),
	Action("Character.Toriel.Attack2", char_sans_attack_2)
];
special_action = SpecialAction("Character.Toriel.SpecialAttack", spr_special_attack_sans, spr_special_attack_sans_locked, char_sans_special_attack);

// Soundtrack
soundtrack_name = "Asgore"; 
soundtrack = snd_asgore;