event_inherited();
// Base
name	    = translate_get("Character.CrossXEvent.Name");
description = translate_get("Character.CrossXEvent.Description");
bio			= translate_get("Character.CrossXEvent.Bio");

// HP
max_hp = 120;
hp = 120;

// Damage
damage = 5;
invulnerability = true;

// Soul
soul = spr_battle_soul;

// Skin
skin_name = translate_get("CharactersStyles.XEvent");
frame = spr_cross_xevent_frame;

// Animations
idle_animation = spr_cross_xevent_idle;
after_battle_animation = spr_cross_xevent_idle;
defeated_animation = spr_cross_xevent_idle;

// Actions
actions = [
	Action("Bones", fight_action_type.attack, cross_attack0),
	Action("BigKnife", fight_action_type.attack, cross_xevent_attack1),
	Action("Gasterblasters", fight_action_type.attack, cross_xevent_attack2)
];

// Special
has_gravity_change = false;
use_gravity_attack = false;