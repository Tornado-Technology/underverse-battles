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

passive_skill = PassiveSkill("Character.SockPolice.PassiveSkill");
actions = [
	Action("Character.SockPolice.Attack0", dan_attack_0),
	Action("Character.SockPolice.Attack1", dan_attack_1),
	Action("Character.SockPolice.Attack2", dan_attack_2)
];
special_action = SpecialAction("Character.SockPolice.SpecialAttack", spr_empty, dan_special_attack);

soundtrack_name = "The Delta"; 
soundtrack = snd_rude_buster;
