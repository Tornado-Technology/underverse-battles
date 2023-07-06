event_inherited();
// Base
index = character_id.tesmi;
name = translate_get("Character.Tesmi.Name");
description = translate_get("Character.Tesmi.Description");
bio	= translate_get("Character.Tesmi.Bio");
universe = "Maybe";
creator = "Tesmi";

// HP
max_hp = 110;
hp = max_hp;

// Damage
damage = 3;
invulnerability = true;

// Stamina
stamina = 100;
max_stamina = 100;
stamina_regen = 25;
action_stamina_cost = Cost(10, 20, 30);

// Mana
mana = 175;
max_mana = 200;
action_mana_upgrade_cost = Cost(0, 40, 60, 100, 175);
mana_given = 2;
mana_cooldown = 5;

// Soul
soul = spr_soul_tesmi;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_tesmi_frame;

// Animations
idle_animation = spr_tesmi_idle;
after_battle_animation = spr_tesmi_idle;
defeated_animation = spr_tesmi_defeated;

// Actions
passive_skill_name = translate_get("Character.Tesmi.PassiveSkill.Name");
passive_skill_desc = translate_get("Character.Tesmi.PassiveSkill.Description");
actions = [
	Action("Atk1", tesmi_attack_0),
	Action("Atk2", tesmi_attack_1),
	Action("Atk3", tesmi_attack_2)
];

// Soundtrack
soundtrack_name = "vsTesmi"; 
soundtrack = snd_vs_tesmi;

