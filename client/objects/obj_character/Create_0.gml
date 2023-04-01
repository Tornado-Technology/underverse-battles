/// @desc Main character parameters
// Base
index = 0;

name = "Char";
description = "Base character class (Oh no, GML haven't normal OOP).";
bio = "Written by TornadoTech, hears for the benefit of all who want it.";
creator = "TornadoTech";
universe = "UnderverseBattles";
ver = game_version;

// HP
hp = 100;
max_hp = 100;
total_heal = 0; // How many health points the player recovered
defeated = false;

// Damage
damage = 1; // Can be visual trick
invulnerability = false; // Can be visual trick too
total_damage = 0; // How many damage points the player deal
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

// Animations
idle_animation = spr_empty;
after_battle_animation = spr_empty;
defeated_animation = spr_empty;

// Actions
passive_skill = PassiveSkill("");
actions = [
	Action("", undefined),
	Action("", undefined),
	Action("", undefined)
];
special_action = SpecialAction("", spr_empty);

// Special
use_gravity_attack = false;

// Methods
on_dodged = function(player_id) {};
on_taking_damage = function(damage) { return damage };
on_taking_soul_damage = function(soul, damage) { return damage };
on_skipping = function(player_id) {};
on_selected_attack = function(attack_id, player_id) {};

on_revived = function() {
	sprite_index = idle_animation;
	defeated = false;
	x_shift = 3;
	audio_play_sound_once(snd_healing);
};

is_defeated = function() {
	return defeated;
};

get_self = function() {
	return self;
}

// Dev
player_num = -1;

offset_x = 0;
offset_y = 0;
x_shift = 0;
y_shift = 0;

play_animation_after_battle = false;

// Soundtrack
soundtrack_name = "Megalorchestra"; 
soundtrack = snd_megalorchestra;