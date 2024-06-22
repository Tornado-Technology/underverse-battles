event_inherited();
// Base
index = character_id.jevil;
name	    = translate_get("Character.Jevil.Name");
description = translate_get("Character.Jevil.Description");
bio			= translate_get("Character.Jevil.Bio");
universe	= "Deltarune";
creator		= "Toby Fox";

// HP
max_hp = 150;
hp = max_hp;

// Damage
damage = 7;
invulnerability = true;

// Stamina
max_stamina = 100;
stamina = 100;
stamina_regen = 30;
action_stamina_cost = [10, 15, 20];

// Mana
mana = 50;
max_mana = 100;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];

// Soul
soul = spr_battle_soul;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_jevil_frame;

// Animations
idle_animation = spr_jevil_idle;
after_battle_animation = idle_animation;
defeated_animation = irandom(1) ? spr_jevil_defeated_0 :  spr_jevil_defeated_1;

teleport = spr_jevil_teleport; 

teleport_attack = false;


start_angle = image_angle;

// Actions
passive_skill = PassiveSkill("Character.Jevil.PassiveSkill");
actions = [
	Action("Character.Jevil.Attack0", jevil_attack0),
	Action("Character.Jevil.Attack1", jevil_attack1),
	Action("Character.Jevil.Attack2", jevil_attack2)
];

special_action = SpecialAction("Character.Jevil.SpecialAttack", spr_special_attack_sans, spr_special_attack_sans_locked, char_sans_special_attack);


on_skipping = function(player_id) {
	var added_mana = 10;
	fight_add_player_mana(player_id, added_mana);
	if (fight_network_mode) send_fight_mana(added_mana);
}


// Soundtrack
soundtrack_name = "Megalovania"; 
soundtrack =  snd_the_world_revolving;