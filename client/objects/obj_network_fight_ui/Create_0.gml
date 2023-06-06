event_inherited();

rating_text_postfix = translate_get("Battle.Rating")

// Player information
account = network_account_get();
profile = network_profile_get();

// Opponent information
opponent_info = network_fight_opponent_info_get();

var player_id = 1
opp_rp = opponent_get_rating(player_id);
opp_rp_values = set_rank(opp_rp);
opp_badge = opponent_get_badge(player_id);
opp_name = opponent_get_name(player_id);

shift = 100;

set_action = function(value) {
	obj_network_fight_input.send_attack();
}