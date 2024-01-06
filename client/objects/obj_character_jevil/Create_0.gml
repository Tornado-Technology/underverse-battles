event_inherited();
// Base
index = -4;  
name	    = translate_get("Character.Jevil.Name");
description = translate_get("Character.Jevil.Description");
bio			= translate_get("Character.Jevil.Bio");
universe	= "No";
creator	    = "TornadoTech";

// HP
max_hp = 150;
hp = 150;

// Damage
damage = 7;
invulnerability = true;

//stamina
max_stamina = 100;
stamina = 100;
stamina_regen = 30;
action_stamina_cost = [10, 50, 100];

// Mana
mana = 50;
max_mana = 100;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];

frame = spr_jevil_frame;

idle_animation = spr_jevil_idle;
defeated_animation = spr_jevil_idle;

passive_skill = translate_get("Character.Jevil.PassiveSkill");

special_action = SpecialAction("Character.ClassicSans.SpecialAttack", spr_special_attack_sans, spr_special_attack_sans_locked, char_sans_special_attack);

actions = [
	Action("Character.Jevil.Attack0", jevil_attack0),
	Action("Character.Jevil.Attack1", jevil_attack0),
	Action("Character.Jevil.Attack2", jevil_attack0)
];

soundtrack_name = "The World Revolving"; 
soundtrack = snd_the_world_revolving;
