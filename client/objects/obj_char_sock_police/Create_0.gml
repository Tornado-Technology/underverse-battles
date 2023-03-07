event_inherited();

// Base
index = -4; // ЮХУ!!!
name	    = translate_get("Character.SockPolice.Name");
description = translate_get("Character.SockPolice.Description");
bio			= translate_get("Character.SockPolice.Bio");
universe	= "No";
creator	    = "Sosck_Police";

max_hp = 100;
hp = 100;

damage = 5;
invulnerability = true;

stamina = 100;
max_stamina = 100;
stamina_regen = 25;
action_stamina_cost = Cost(10, 15, 20);

mana = 100;
max_mana = 100;
action_mana_cost = Cost(0, 10, 25, 40, 60);
mana_given = 2;
mana_cooldown = 13;

soul = spr_sock_police_soul;

skin_name = translate_get("CharactersStyles.Standard");
frame = spr_sock_police_frame;

idle_animation = spr_sock_police_idle;
after_battle_animation = spr_sock_police_idle;
defeated_animation = spr_sock_police_idle;

passive_skill_name = translate_get("Character.SockPolice.PassiveSkill.Name");
passive_skill_desc = translate_get("Character.SockPolice.PassiveSkill.Description");
actions = [
	Action("Tea", fight_action_type.attack_with_healing, dan_attack_0),
	Action("Atk2", fight_action_type.attack, dan_attack_1),
	Action("Atk3", fight_action_type.attack, dan_attack_2)
];

soundtrack_name = "The Delta"; 
soundtrack = snd_delta;
