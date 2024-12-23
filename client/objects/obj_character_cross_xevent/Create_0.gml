event_inherited();
// Base
index = 7;
name	    = translate_get("Character.CrossXEvent.Name");
description = translate_get("Character.CrossXEvent.Description");
bio			= translate_get("Character.CrossXEvent.Bio");

// HP
max_hp = 120;
hp = 120;

// Damage
damage = 5;
invulnerability = true;

// Stamina
stamina_regen = 25;

// Soul
soul = spr_battle_soul;

// Skin
skin_name = translate_get("CharactersStyles.XEvent");
frame = spr_cross_xevent_frame;

// Animations
idle_animation = spr_cross_xevent_idle;
after_battle_animation = spr_cross_xevent_idle;
defeated_animation = spr_cross_xevent_defeated;
start1_animation = spr_cross_xevent_start1;
fight1_animation = spr_cross_xevent_fight1;
end1_animation = spr_cross_xevent_end1;

// Actions
passive_skill = PassiveSkill("Character.CrossXEvent.PassiveSkill");
actions = [
	Action("Character.CrossXEvent.Attack0", cross_xevent_attack0),
	Action("Character.CrossXEvent.Attack1", cross_xevent_attack1),
	Action("Character.CrossXEvent.Attack2", cross_xevent_attack2),
];
special_action = SpecialAction("Character.CrossXEvent.SpecialAttack", spr_special_attack_cross, spr_special_attack_cross_locked, cross_xevent_special_attack, 10);

// Special
has_gravity_change = false;
use_gravity_attack = false;