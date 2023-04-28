///@desc Инк - Про атаки

if (fight_get_state() != fight_state.choosing)
	exit;

var trigger = fight_get_player_hp(0) == fight_get_player_max_hp(0);
var text_ = translate_get("Dialog." + episode + "Dialog5");

array_delete(text_, trigger, 1);

dlg = dialog_create(text_, dir.down);
			
/* Options */
fight_set_pause(false);

/* Next scenario */
scenario = 7;