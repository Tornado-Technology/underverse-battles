draw_reset();

if (!show) exit;

var width = display_get_gui_width();

// Title
draw_set_font(global._font_main_determination);
draw_set_halign(fa_center);
draw_text_outlined(width / 2, 10, c_white, c_black, title);

// Ready players count
draw_set_halign(fa_center);
draw_text_outlined(width / 2, 100, c_white, c_black, translate_get("Menu.Multiplayer.ReadyPlayers") + $": {player_count}");

button_cancel.draw(width / 2, 220);

if (is_private) exit;

if (waiting_is_over && player_count <= 1) {
	draw_set_font(global._font_main_mini);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text_ext(width / 2, 50, translate_get("Menu.Multiplayer.NoPlayers"), 10, 240);
}