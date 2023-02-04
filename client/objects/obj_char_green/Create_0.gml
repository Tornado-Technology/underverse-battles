event_inherited();
// Base
index = 8;
name	    = translate_get("Character.Green.Name");
description = translate_get("Character.Green.Description");
bio			= translate_get("Character.Green.Bio");
universe	= "Gamatale";
creator		= "Fortherehero";

// HP
max_hp = 70;
hp = 70;

// Damage
damage = 1;
invulnerability = false;

// Stamina
max_stamina = 100;
stamina = 100;
stamina_regen = 25;
action_stamina_cost = [10, 15, 25];

// Mana
mana = 50;
max_mana = 100;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];

// Soul
soul = spr_battle_soul_green_corrupted;

// Skins
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_green_frame;

// Animations
idle_animation = spr_green;
after_battle_animation = spr_green;
defeated_animation = spr_green;

// Actions
passive_skill_name = translate_get("Character.Green.PassiveSkill.Name");
passive_skill_desc = translate_get("Character.Green.PassiveSkill.Description");
actions = [
	Action("BonesAndSpikes", fight_action_type.attack, green_attack0),
	Action("Strings", fight_action_type.attack, green_attack1),
	Action("TurboBlaster", fight_action_type.attack, green_attack2)
];

// Soundtrack
soundtrack_name = "Edit The Battle"; 
soundtrack = snd_edit_the_battle;
