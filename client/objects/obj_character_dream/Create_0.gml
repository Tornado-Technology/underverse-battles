event_inherited();
// Base
index = 9;
name	    = translate_get("Character.Dream.Name");
description = translate_get("Character.Dream.Description");
bio			= translate_get("Character.Dream.Bio");
universe	= "Dreamtale";
creator		= "Joku";

// HP
max_hp = 120;
hp = 120;

// Damage
damage = 6;
invulnerability = true;

// Stamina
max_stamina = 120;
stamina = 120;
stamina_regen = 25;
action_stamina_cost = [10, 10, 20];

// Mana
mana = 50;
max_mana = 100;
action_mana_upgrade_cost = [0, 10, 25, 40, 60];

// Soul
soul = spr_battle_soul;

// Skin
skin_name = translate_get("CharactersStyles.Classic");
frame = spr_sans_frame;

// Animations
idle_animation = spr_dream_idle;
after_battle_animation = spr_dream_idle;
defeated_animation = spr_dream_defeated;
fight_0_start_animation = spr_dream_star_rod_start;
fight_0_idle_animation = spr_dream_star_rod_idle;
fight_0_finish_animation = spr_dream_star_rod_finish;
fight_1_start_animation = spr_dream_blades_start;
fight_1_idle_animation = spr_dream_blades_idle;
fight_1_finish_animation = spr_dream_blades_finish;
fight_2_start_animation = spr_dream_bow_start;
fight_2_idle_animation = spr_dream_bow_idle;
fight_2_finish_animation = spr_dream_bow_finish;

// Actions
passive_skill = PassiveSkill("Character.Dream.PassiveSkill");
actions = [
	Action("Character.Dream.Attack0", call_attack_dream_0),
	Action("Character.Dream.Attack1", call_attack_dream_1),
	Action("Character.Dream.Attack2", call_attack_dream_2)
];
special_action = SpecialAction("Character.Dream.SpecialAttack", spr_special_attack_sans, spr_special_attack_sans_locked, error_sans_special_attack);

on_battle_end = function(damage) {
	if (damage == 0) {
		special_action.percent += 10;
		if (special_action.percent > 100) {
			special_action.percent = 100;
		}
	}
};

// Soundtrack
soundtrack_name = "Megalovania"; 
soundtrack = snd_megalovania;