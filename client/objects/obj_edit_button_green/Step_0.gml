if (!is_can_input) exit;
if (fight_get_initiative() != 0) exit;

if (input_check_pressed(input.special)) {
	network_check_press(get_random_attack_type());
	send_to_server();
}