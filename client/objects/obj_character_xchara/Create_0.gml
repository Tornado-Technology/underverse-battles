event_inherited();
// Base
index = 6;
name	    = translate_get("Character.XtaleChara.Name");
description = translate_get("Character.XtaleChara.Description");
bio			= translate_get("Character.XtaleChara.Bio");
universe	= "XTale";
creator		= "Jakei";

// HP
max_hp = 6000000;
hp = 6000000;
damage = 5;
invulnerability = true;

// Stamina
max_stamina = 100;
stamina = 100;
stamina_regen = 15;
action_stamina_cost = Cost(5, 10, 20);

// Mana
mana = 500000;
max_mana = 1000000;
action_mana_upgrade_cost = Cost(0, 10, 25, 40, 60);

// Soul
soul = spr_battle_soul_red;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_xchara_frame;

// Animations
idle_animation = spr_xchara_idle;
after_battle_animation = spr_xchara_idle;
defeated_animation = spr_xchara_defeated;
start2_animation = spr_xchara_attack2_start;
fight2_animation = spr_xchara_attack2_fight;
end2_animation = spr_xchara_attack2_finish;

// Actions
passive_skill = PassiveSkill("Character.XtaleChara.PassiveSkill");
actions = [
	Action("Character.XtaleChara.Attack0", xchara_attack0),
	Action("Character.XtaleChara.Attack1", xchara_attack1),
	Action("Character.XtaleChara.Attack2", xchara_attack2)
];
special_action = SpecialAction("Character.XtaleChara.SpecialAttack", spr_special_attack_xchara, xchara_special_attack, 100, false);

// Special
on_dodged = function(player_id) {
	if (hp < 20)
		fight_add_player_mana(player_id, 10);
};

// Soundtrack
soundtrack_name = "Overwrite"; 
soundtrack = snd_overwrite;