/// @desc Main character parameters
// Base
index = 0;
char_id = 0;

name = "Char";
description = "Base character class (Oh no, GML haven't normal OOP).";
bio = "Written by TornadoTech, hears for the benefit of all who want it.";
creator = "TornadoTech";
universe = "UnderverseBattles";
ver = game_version;

idle_animation = spr_empty;
after_battle_animation = spr_empty;
defeated_animation = spr_empty;

// HP
hp = 100;
max_hp = 100;

// Damage
damage = 1; // Can be visual trick
invulnerability = false; // Can be visual trick too
max_getting_damage = 100;

// Stamina
stamina = 100;
max_stamina = 100;
stamina_regen = 25;
action_stamina_cost = Cost(10, 15, 20);

// Mana
mana = 100;
max_mana = 100;
action_mana_cost = Cost(0, 10, 25, 40, 60);
mana_given = 2;
mana_cooldown = 13;

// Soul
soul = spr_battle_soul;

// Skin
skin_name = "The Char!";
frame = spr_empty;

// Actions
passive_skill_name = translate_get("PassiveSkill.Empty");
passive_skill_desc = translate_get("PassiveSkillDescription.Empty");
actions = [
	Action("Atk1", fight_action_type.attack, undefined),
	Action("Atk2", fight_action_type.attack, undefined),
	Action("Atk3", fight_action_type.attack, undefined)
];

// Special
has_gravity_change = false;
gravity_attack_num = -1;
use_gravity_attack = false;
on_dodged = function() {};
on_taking_damage = function(damage) { return damage };
on_skipping = function() {};
on_selected_attack = function(attack_id, enemy_id) {};

// Dev
player_num = -1;
offset_x = 0;
offset_y = 0;
enemy_id = -1;
play_animation_after_battle = false;

total_damage = 0;
total_heal = 0;

// Soundtrack
soundtrack_name = "Megalorchestra"; 
soundtrack = snd_megalorchestra;

get_self = function() {
	return self;
}