event_inherited();
index = 8;
name	    = translate_get("Character.Dream.Name");
description = translate_get("Character.Dream.Description");
bio			= translate_get("Character.Dream.Bio");
universe	= "Dreamtale";
creator		= "Joku";

max_hp = 120;
hp = max_hp;

// Damage
damage = 5;
invulnerability = true;

// Stamina
max_stamina = 120;
stamina = max_stamina;
stamina_regen = 25;
action_stamina_cost = [10, 15, 20];

// Mana
mana = 50;
max_mana = 100;

// Soul
soul = spr_soul_dream;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_dream_frame;

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
special_action = SpecialAction("Character.Dream.SpecialAttack", spr_special_attack_dream, spr_special_attack_dream_locked, call_attack_dream_special);

on_taking_damage = function(damage) {
	if (damage > dtime)
		return damage;
	
	special_action.percent += damage;
	special_action.percent = clamp(special_action.percent, 0, 100);
	return damage;
}

on_battle_end = function(damage) {
	if (damage > 0)
		return;
		
	var _player_id = fight_get_next_initiative()
	fight_player_add_special_action_percent_custom(_player_id, 10);
}

// Soundtrack
soundtrack_name = "Valiant Heart"; 
soundtrack = snd_valiant_heart_rock_remix;