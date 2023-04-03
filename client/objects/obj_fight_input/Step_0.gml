// They forgot to add polymorphism - Tesmi
/// @desc All code here!

input_ability = is_desktop ? input_check_held(input.skip) : input_check_held(input.action);

// Actualy player don't choose yet
if (!fight_player_selecting(0)) exit;

// Inciative
var initiative      = fight_get_initiative();
var initiative_next = fight_get_next_initiative();
var is_player_turn  = initiative == 0;

// All input in keyboard
var input_raw_v = input_check_pressed(input.down) - input_check_pressed(input.up);
var input_raw_h = input_check_pressed(input.right) - input_check_pressed(input.left);
var input_select = input_check_pressed(input.action);
var input_skip = input_check_pressed(input.skip);
var input_special = input_check_pressed(input.special);

// Power bar
if (can_select && can_select_power && is_player_turn) {
	if (abs(input_raw_h)) {
		var power_min = 0;
		var power_max = 4;
	
		// Next uograde cost
		var can_select_next_power = fight_get_player_mana(0) >= fight_get_player_action_mana_cost(0, clamp(selected_power + 1, power_min, power_max));
	
		// Can add power if we have some mana or if we below manabar
		if (can_select_next_power || input_raw_h < 0) {
			selected_power = clamp(selected_power + input_raw_h, power_min, power_max);
		}
	
		audio_play_sound(sound_click, 0, false);
	}
}

// TODO: Напишу так что-бы передать точность, нужно сделать 
// перепрыгивания черех неправельные варианты которые нельзя выбрать

// Action bar
if (can_select) {
	if (abs(input_raw_v)) {
		var action_min = 0;
		var action_max = 2;
	
		selected_action += input_raw_v;
		selected_action = selected_action > action_max ? 0 : selected_action;
		selected_action = selected_action < action_min ? action_max : selected_action;

		audio_play_sound(sound_click, 0, false);
	}
}

if (input_select && can_select) {
	confirm_action_and_power();
}

// Skiping (no comments)
if (input_skip && can_skip) {
	skip();
}

// Special attack
if (can_select && is_player_turn && fight_check_player_special_action_readiness(0)) {
	if (input_special) {
		special_action();
		audio_play_sound_once(snd_special_attack);
	}
}