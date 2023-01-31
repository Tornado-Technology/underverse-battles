event_inherited();
account = network_account;
profile = network_profile;

your_rp = profile.rating;
your_rp_values = set_rank(your_rp);

var enemy_id = 1
opp_rp = opponent_get_rating(enemy_id);
opp_rp_values = set_rank(opp_rp);
opp_badge = opponent_get_badge(enemy_id);

shift = 100;

set_action = function(value) {
	obj_network_fight_input.send_attack();
}