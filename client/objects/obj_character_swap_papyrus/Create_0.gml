event_inherited();
// Base
index = 5;
name	    = translate_get("Character.SwapPapyrus.Name");
description = translate_get("Character.SwapPapyrus.Description");
bio			= translate_get("Character.SwapPapyrus.Bio");
universe	= "Underswap";
creator		= "AU Community";

// HP
max_hp = 100;
hp = 100;

// Damage
damage = 1;
invulnerability = false;

// Stamina
max_stamina = 100;
stamina = 100;
stamina_regen = 20;
action_stamina_cost = Cost(10, 15, 20);

// Mana
mana = 50;
max_mana = 100;
action_mana_upgrade_cost = Cost(0, 10, 25, 40, 60);

//Soul
soul = spr_battle_soul;

// Skin
skin_name = translate_get("CharactersStyles.Standard");
frame = spr_swap_papyrus_frame;

// Animations
idle_animation = spr_swap_papyrus_idle;
after_battle_animation = spr_swap_papyrus_smoking;
defeated_animation = spr_swap_papyrus_defeated;

hand_up_animation = spr_swap_papyrus_attack_2_up;
hand_down_up_animation = spr_swap_papyrus_attack_2_down_up;
hand_left_up_animation = spr_swap_papyrus_attack_2_left_up;
hand_right_up_animation = spr_swap_papyrus_attack_2_right_up;
hand_down_animation = spr_swap_papyrus_attack_2_down;
hand_up_down_animation = spr_swap_papyrus_attack_2_up_down;
hand_left_down_animation = spr_swap_papyrus_attack_2_left_down;
hand_right_down_animation = spr_swap_papyrus_attack_2_right_down;
hand_left_animation = spr_swap_papyrus_attack_2_left;
hand_up_left_animation = spr_swap_papyrus_attack_2_up_left;
hand_down_left_animation = spr_swap_papyrus_attack_2_down_left;
hand_right_left_animation = spr_swap_papyrus_attack_2_right_left;
hand_right_animation = spr_swap_papyrus_attack_2_right;
hand_up_right_animation = spr_swap_papyrus_attack_2_up_right;
hand_down_right_animation = spr_swap_papyrus_attack_2_down_right;
hand_left_right_animation = spr_swap_papyrus_attack_2_left_right;

// Actions
passive_skill = PassiveSkill("Character.SwapPapyrus.PassiveSkill");
actions = [
	Action("Character.SwapPapyrus.Attack0", swap_papyrus_attack0),
	Action("Character.SwapPapyrus.Attack1", swap_papyrus_attack1),
	Action("Character.SwapPapyrus.Attack2", swap_papyrus_attack2)
];
special_action = SpecialAction("Character.SwapPapyrus.SpecialAttack", spr_special_attack_sans, spr_special_attack_sans_locked, swap_papyrus_special_attack);

// Special
hand_dir_previous = dir.left;
use_gravity_attack = true;

on_skipping = function(player_id) {
	var added_mana = 10;
	fight_add_player_mana(player_id, added_mana);
	if (fight_network_mode) send_fight_mana(added_mana);
}

change_sprite_hand_dir = function(hand_dir) {
	if (hand_dir_previous == dir.up && hand_dir == dir.up) sprite_index = hand_left_up_animation;
	if (hand_dir_previous == dir.down && hand_dir == dir.up) sprite_index = hand_down_up_animation;
	if (hand_dir_previous == dir.left && hand_dir == dir.up) sprite_index = hand_left_up_animation
	if (hand_dir_previous == dir.right && hand_dir == dir.up) sprite_index = hand_right_up_animation;
	if (hand_dir_previous == dir.up && hand_dir == dir.down) sprite_index = hand_up_down_animation;
	if (hand_dir_previous == dir.down && hand_dir == dir.down) sprite_index = hand_left_down_animation;
	if (hand_dir_previous == dir.left && hand_dir == dir.down) sprite_index = hand_left_down_animation;
	if (hand_dir_previous == dir.right && hand_dir == dir.down) sprite_index = hand_right_down_animation;
	if (hand_dir_previous == dir.up && hand_dir == dir.left) sprite_index = hand_up_left_animation;
	if (hand_dir_previous == dir.down && hand_dir == dir.left) sprite_index = hand_down_left_animation;
	if (hand_dir_previous == dir.left && hand_dir == dir.left) sprite_index = hand_left_animation;
	if (hand_dir_previous == dir.right && hand_dir == dir.left) sprite_index = hand_right_left_animation;
	if (hand_dir_previous == dir.up && hand_dir == dir.right) sprite_index = hand_up_right_animation;
	if (hand_dir_previous == dir.down && hand_dir == dir.right) sprite_index = hand_down_right_animation;
	if (hand_dir_previous == dir.left && hand_dir == dir.right) sprite_index = hand_left_right_animation;
	if (hand_dir_previous == dir.right && hand_dir == dir.right) sprite_index = hand_left_right_animation;
	hand_dir_previous = hand_dir;
}

stop_hand_wave = function() {
	sprite_index = idle_animation;
}

// Soundtrack
soundtrack_name = "Disappointment"; 
soundtrack = snd_disappointment;