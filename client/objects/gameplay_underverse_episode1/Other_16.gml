///@desc Инк - Про атаки

if (fight_get_state() != fight_state.choosing)
	exit;

fight_set_ui_showing_action_box(false);
fight_set_player_input(false);

var hp = fight_get_player_hp(0);
var hp_max = fight_get_player_max_hp(0);

var trigger = 0;
if (hp < hp_max) trigger = 1;
if (hp < 2 * hp_max / 3) trigger = 2;


var text_ = translate_get("Dialog." + episode + "Dialog5");

var i = 0;
repeat (3) {
	show_debug_message(string(i) + "  " + string(trigger))
	if (i != trigger) {
		array_delete(text_, i, 1);
		trigger--;
	}
	else {
		i++;
	}
}

dlg = dialog_create(text_, dir.down);
			
/* Options */
fight_set_pause(false);

/* Next scenario */
scenario = 7;