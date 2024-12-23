event_inherited();
index = 9;
name	    = translate_get("Character.Nightmare.Name");
description = translate_get("Character.Nightmare.Description");
bio			= translate_get("Character.Nightmare.Bio");
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
soul = spr_soul_nightmare;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_nightmare_frame;

// Animations
idle_animation = spr_nightmare_idle;
after_battle_animation = spr_nightmare_after_battle;
defeated_animation = spr_nightmare_defeated;
defeated_animation_last_image = spr_nightmare_defeated_last_image;

fight_1_start_animation = spr_nightmare_start1;
fight_1_idle_animation = spr_nightmare_fight1;
fight_1_finish_animation = spr_nightmare_end1;
special_attack_start_animation = spr_nightmare_teleporting;
special_attack_idle_animation = spr_empty;
special_attack_finish_animation = spr_nightmare_teleporting_back;

transition_animation = true;

// Actions
passive_skill = PassiveSkill("Character.Nightmare.PassiveSkill");
actions = [
	Action("Character.Nightmare.Attack0", call_attack_nightmare_0),
	Action("Character.Nightmare.Attack1", call_attack_nightmare_1),
	Action("Character.Nightmare.Attack2", call_attack_nightmare_2)
];

special_action = SpecialAction("Character.Nightmare.SpecialAttack", spr_special_attack_nightmare, spr_special_attack_nightmare_locked, call_attack_nightmare_special);


on_taking_damage = function(damage) {
	var _player_id = fight_get_next_initiative();
	fight_player_add_special_action_percent_custom(_player_id, damage);
	return damage;
}

// Soundtrack
soundtrack_name = "Black Apple"; 
soundtrack = snd_black_apple;
