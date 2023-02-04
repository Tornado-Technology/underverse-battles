event_inherited();
// Base
index = -3; // ЮХУ!!!
name	    = translate_get("Character.Tornado.Name");
description = translate_get("Character.Tornado.Description");
bio			= translate_get("Character.Tornado.Bio");
universe	= "No";
creator	    = "TornadoTech";

// HP
max_hp = 50;
hp = 50;

// Damage
damage = 3;
invulnerability = false;

// Stamina
stamina = 200;
max_stamina = 200;
stamina_regen = 45;
action_stamina_cost = [25, 65, 125];

// Mana
mana = 175;
max_mana = 200;
action_mana_upgrade_cost = [0, 40, 60, 100, 175];
mana_given = 2;
mana_cooldown = 10;

// Soul
soul = spr_tornado_soul;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_tornado_frame;

// Animations
idle_animation = spr_tornado_idle;
after_battle_animation = spr_tornado_idle;
defeated_animation = spr_tornado_idle;

// Actions
passive_skill_name = translate_get("Character.Tornado.PassiveSkill.Name");
passive_skill_desc = translate_get("Character.Tornado.PassiveSkill.Description");
actions = [
	Action("Tea", fight_action_type.attack_with_healing, dan_attack_0),
	Action("Atk2", fight_action_type.attack, dan_attack_1),
	Action("Atk3", fight_action_type.attack, dan_attack_2)
];

// Soundtrack
soundtrack_name = "The Delta"; 
soundtrack = snd_delta;
