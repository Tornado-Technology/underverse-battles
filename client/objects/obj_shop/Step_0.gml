if (global.pause_game) exit;

ui.update();

if (npc == noone) exit;

if (ui.dialog.is_flipping()) {
	npc.speak();
} else {
	npc.stop_speaking();
}