event_inherited();
index = 12;
name	    = translate_get("Character.XAnastasia.Name");
description = translate_get("Character.XAnastasia.Description");
bio			= translate_get("Character.XAnastasia.Bio");
universe	= "XTale";
creator		= "Anastasia_Color";


max_hp = 120;
hp = max_hp;

// Damage
damage = 6;
invulnerability = true;

// Stamina
max_stamina = 120;
stamina = max_stamina;
stamina_regen = 25;
action_stamina_cost = [10, 15, 20];

// Mana
mana = 50;
max_mana = 100;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];

// Soul
soul = spr_battle_soul;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_dream_frame;

// Animations
idle_animation = spr_anastasia_idle;
after_battle_animation = spr_anastasia_idle;
defeated_animation =  spr_anastasia_defeated;
fight_1_start_animation = spr_anastasia_swords_start;
fight_1_idle_animation = spr_anastasia_swords_idle;
fight_1_finish_animation = spr_anastasia_swords_finish;
fight_2_start_animation = spr_anastasia_scythe_start;
fight_2_idle_animation = spr_anastasia_swords_idle;
fight_2_finish_animation = spr_anastasia_scythe_finish;

// Actions
passive_skill = PassiveSkill("Character.XAnastasia.PassiveSkill");
actions = [
	Action("Character.XAnastasia.Attack0", call_attack_anastasia_0),
	Action("Character.XAnastasia.Attack1", call_attack_anastasia_1),
	Action("Character.XAnastasia.Attack2", call_attack_dream_2)
];
special_action = SpecialAction("Character.XAnastasia.SpecialAttack", spr_special_attack_sans, spr_special_attack_sans_locked, call_attack_dream_special);

on_taking_soul_damage = function(soul, damage) {
	if (damage > dtime)
		return damage;
	
	special_action.percent += damage;
	special_action.percent = clamp(special_action.percent, 0, 100);
	return damage;
}

// Soundtrack
soundtrack_name = "Rude Buster"; 
soundtrack = snd_rude_buster;