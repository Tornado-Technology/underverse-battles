event_inherited();
// Base
index = 20;
name	    = translate_get("Character.Frisk.Name");
description = translate_get("Character.Frisk.Description");
bio			= translate_get("Character.Frisk.Bio");
universe	= "Undertale";
creator		= "Toby Fox";

// HP
max_hp = 60;
hp = 60;

// Damage
damage = 5;
invulnerability = false;

// Stamina
max_stamina = 100;
stamina = 100;
stamina_regen = 20;
action_stamina_cost = [10, 15, 20];

// Mana
mana = 50;
max_mana = 100;

// Soul
soul = spr_battle_soul_red;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_frisk_frame;

// Animations
idle_animation = spr_empty;
after_battle_animation = spr_empty;
defeated_animation = spr_empty;

walking_down_animation = spr_frisk_walking_down;
walking_up_animation = spr_frisk_walking_up;
walking_left_animation = spr_frisk_walking_left;
walking_right_animation = spr_frisk_walking_right;

standing_down_animation = spr_frisk_standing_down;
standing_up_animation = spr_frisk_standing_up;
standing_left_animation = spr_frisk_standing_left;
standing_right_animation = spr_frisk_standing_right;

// Actions
passive_skill = PassiveSkill("Character.Frisk.PassiveSkill");
actions = [
	Action("Character.Frisk.Attack0", char_sans_attack_0),
	Action("Character.Frisk.Attack1", char_sans_attack_1),
	Action("Character.Frisk.Attack2", char_sans_attack_2)
];
special_action = SpecialAction("CharacterFrisk.SpecialAttack", spr_special_attack_sans, spr_special_attack_sans_locked, char_sans_special_attack);

// Movement
can_run = true;

// Soundtrack
soundtrack_name = "Megalovania"; 
soundtrack = snd_megalovania;