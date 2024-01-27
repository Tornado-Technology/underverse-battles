event_inherited();
index = 10;
name	    = translate_get("Character.Nightmare.Name");
description = translate_get("Character.Nightmare.Description");
bio			= translate_get("Character.Nightmare.Bio");
universe	= "Dreamtale";
creator		= "Joku";


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
skin_name = translate_get("CharactersStyles.Classic");
frame = spr_sans_frame;

// Animations
idle_animation = spr_char_sans_idle;
after_battle_animation = spr_sans_after_battle;
defeated_animation = spr_char_sans_defeated;

// Actions
passive_skill = PassiveSkill("Character.Nightmare.PassiveSkill");
actions = [
	Action("Character.Nightmare.Attack0", call_attack_nightmare_0),
	Action("Character.Nightmare.Attack1", call_attack_dream_1),
	Action("Character.Nightmare.Attack2", call_attack_dream_2)
];
special_action = SpecialAction("Character.Nightmare.SpecialAttack", spr_special_attack_sans, spr_special_attack_sans_locked, call_attack_dream_special);

on_taking_soul_damage = function(soul, damage) {
	if (damage > dtime)
		return damage;
	
	special_action.percent += damage;
	special_action.percent = clamp(special_action.percent, 0, 100);
	return damage;
}

// Soundtrack
soundtrack_name = "Megalovania"; 
soundtrack = snd_megalovania;