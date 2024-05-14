event_inherited();
index = 11;

name	    = translate_get("Character.Papyrus.Name");
description = translate_get("Character.Papyrus.Description");
bio			= translate_get("Character.Papyrus.Bio");
universe	= "Undertale";
creator		= "Toby Fox";

//HP
max_hp = 120;
hp = max_hp;

//Damage
damage = 5;
invulnerability = true;

//Stamina 
max_stamina = 120;
stamina = max_stamina;
stamina_regen = 25;
action_stamina_cost = [10, 15, 15];

//Mana
max_mana = 100;
mana = 50;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];

//Soul
soul = spr_battle_soul;

idle_animation = spr_papyrus_idle;
after_battle_animation = spr_swap_sans_idle;
defeated_animation = spr_papyrus_defeated;
defeated_animation_last_image = spr_papyrus_defeated_last_image;
fight_0_start_animation = spr_papyrus_attack_0_start;
fight_0_idle_animation = spr_papyrus_attack_0_idle;
fight_0_finish_animation = spr_papyrus_attack_0_finish;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_papyrus_frame;

// Actions
passive_skill = PassiveSkill("Character.Papyrus.PassiveSkill");
actions = [
	Action("Character.Papyrus.Attack0", call_attack_papyrus_0),
	Action("Character.Papyrus.Attack1", call_attack_papyrus_1),
	Action("Character.Papyrus.Attack2", call_attack_papyrus_2)
];
special_action = SpecialAction("Character.Papyrus.SpecialAttack", spr_special_attack_sans, spr_special_attack_sans_locked, char_sans_special_attack);

// Soundtrack
soundtrack_name = "Bonetrousle"; 
soundtrack = snd_megalovania;