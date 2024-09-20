event_inherited();
// Base
index = CHARACTER_ID.DREAM;
name	    = translate_get("Character.Green.Name");
description = translate_get("Character.Green.Description");
bio			= translate_get("Character.Green.Bio");
universe	= "Gamatale";
creator		= "Fortherehero";

// HP
max_hp = 80;
hp = 80;

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
soul = spr_soul_green_corrupted;

// Skins
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_green_frame;

// Animations
idle_animation = spr_green_idle;
after_battle_animation = spr_green_idle;
defeated_animation = spr_green_defeated;
start1_animation = spr_green_attack1_start;
fight1_animation = spr_green_attack1_fight;
end1_animation = spr_green_attack1_finish;

// Actions
passive_skill = PassiveSkill("Character.Green.PassiveSkill");
actions = [
	Action("Character.Green.Attack0", green_attack0),
	Action("Character.Green.Attack1", green_attack1),
	Action("Character.Green.Attack2", green_attack2)
];
special_action = SpecialAction("Character.Green.SpecialAttack", spr_special_attack_green, spr_special_attack_green_locked, green_special_attack);

// Soundtrack
soundtrack_name = "Edit The Battle"; 
soundtrack = snd_edit_the_battle;
