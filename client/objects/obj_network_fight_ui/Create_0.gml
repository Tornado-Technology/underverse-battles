event_inherited();
account = network_account;
profile = network_profile;

your_rp = profile.rating;
your_rp_values = set_rank(your_rp);

var player_id = 1
opp_rp = opponent_get_rating(player_id);
opp_rp_values = set_rank(opp_rp);
opp_badge = opponent_get_badge(player_id);
opp_name = opponent_get_name(player_id);

shift = 100;

set_action = function(value) {
	obj_network_fight_input.send_attack();
}

draw_rp = function(text_x, text_y, str_color, outline_color, rp) {
	if (global.rating_mode) {
		draw_text_outlined(text_x, text_y, str_color, outline_color, string(rp) + " " + translate_get("Battle.Rating"));
	}
}