/// @desc Main character parameters
// Base
index = 0;

name = "Char";
description = "Base character class (Oh no, GML haven't normal OOP).";
bio = "Written by TornadoTech, hears for the benefit of all who want it.";
creator = "TornadoTech";
universe = "UnderverseBattles";

// HP
hp = 100000000;
max_hp = 100000000;
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

walking_down_animation = spr_empty;
walking_up_animation = spr_empty;
walking_left_animation = spr_empty;
walking_right_animation = spr_empty;

standing_down_animation = spr_empty;
standing_up_animation = spr_empty;
standing_left_animation = spr_empty;
standing_right_animation = spr_empty;

// Actions
passive_skill = PassiveSkill("");
actions = [
	Action("", undefined),
	Action("", undefined),
	Action("", undefined)
];
special_action = SpecialAction("", spr_empty, spr_empty);

// Special
use_gravity_attack = false;

// Movement
is_moving = false;
is_controlled = false;
can_run = false;
is_running = false;
is_following = false;
follow_target = noone;
follow_distance = 25;
movement_x = 0;
movement_y = 0;
following = false;
follow_x = 0;
follow_y = 0;
x_new = x;
y_new = y;
speed_const = 2;
run_coefficient = 0.5;

// Methods
move = function(_x, _y, _speed) {
	is_moving = true;
	x_new = x + _x;
	y_new = y + _y;
	speed_const = _speed;
};

skip_moving = function() {
	is_moving = false;
	x = x_new;
	y = y_new;
	speed_const = 0;
};

control = function(is_showing_arrows = false, _can_run = can_run, _speed = speed_const) {
	camera_set_taget(self);
	is_controlled = true;
	can_run = _can_run;
	speed_const = _speed;
	
	previous_positions = ds_queue_create();
	ds_queue_enqueue(previous_positions, new Vector2(x, y));
	
	if (!is_showing_arrows) return;
	instance_create_depth(x, y - sprite_height - 1, depth, obj_control_character, {
		target: id
	});
};

set_controlled = function() {
	is_controlled = true;
};

set_uncontrolled = function() {
	is_controlled = false;
	change_sprite_by_condition(sprite_index == walking_right_animation, standing_right_animation);
	change_sprite_by_condition(sprite_index == walking_left_animation, standing_left_animation);
	change_sprite_by_condition(sprite_index == walking_down_animation, standing_down_animation);
	change_sprite_by_condition(sprite_index == walking_up_animation, standing_up_animation);
};

follow = function(_follow_target, _follow_distance = follow_distance, _speed = speed_const) {
	is_following = true;
	speed_const = _speed;
	follow_target = _follow_target;
	follow_distance = _follow_distance;
};

unfollow = function() {
	is_following = false;
};

on_dodged = function(player_id) {};
on_battle_end = function(damage) {};
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

change_sprite_to_other_sprite = function(previous_sprite, new_sprite) {
	if (sprite_index == previous_sprite)
		sprite_index = new_sprite;
}

change_sprite_by_condition = function(condition, new_sprite) {
	if (condition) {
		sprite_index = new_sprite;
	}
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