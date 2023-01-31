///@desc Инк - Про атаки

if (fight_get_state() != fight_state.choosing)
	exit;

var trigger = fight_get_enemy_hp(0) == fight_get_enemy_max_hp(0);
var text_ = translate_get("Dialog." + episode + "Dialog5");

array_delete(text_, trigger, 1);

dlg = dialog_create(text_);
			
/* Options */
fight_set_pause(false);

/* Next scenario */
scenario = 7;