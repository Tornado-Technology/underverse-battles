event_inherited();

send_attack = function() {
	send_fight_power(selected_power);
	send_fight_action(selected_action);
}

set_action_power = function() {
	send_attack();
}