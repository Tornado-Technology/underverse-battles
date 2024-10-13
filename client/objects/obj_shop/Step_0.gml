if (global.pause_game) exit;

ui.update();

if (npc == noone) exit;

if (ui.dialog.is_flipping()) {
	npc.speak();
} else {
	npc.stop_speaking();
}

if (shift_for_item_counter != 0) {
	shift_for_item_counter = -shift_for_item_counter + sign(shift_for_item_counter) * 0.1;
}
if (shift_for_money_counter != 0) {
	shift_for_money_counter = -shift_for_money_counter + sign(shift_for_money_counter) * 0.1;
}