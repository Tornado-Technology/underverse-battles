// Game Version
if (page_index >= menu_page.settings && page_index <= menu_page.settings_beta) {
	draw_set_font(font_console_mini);
	draw_set_halign(fa_left);
	
	if (game_hash != undefined) {
		draw_text_outlined(4, height - 20, c_grey, c_black, "Hash: " + string(game_hash));
	}
	
	draw_text_outlined(4, height - 10, c_grey, c_black, game_version + " " + game_build);
	draw_reset();
}

// User Data
var account = network_account;
var profile = network_profile;
if (account != undefined && profile != undefined) {
	if (page_index == menu_page.multiplayer_account || page_index == menu_page.account_settings) {
		draw_set_font(font_console_mini);
		draw_set_halign(fa_left);
		draw_text_outlined(4, height - 20, c_grey, c_black, $"Current Account: {account.username}");
		draw_text_outlined(4, height - 10, c_grey, c_black, $"{profile.rating} RP");
	}
}