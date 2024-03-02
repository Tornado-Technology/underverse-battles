if (!is_can_input) exit;
if (fight_get_initiative() != 0) exit;

if (input_check_pressed(input.special)) {
	press(irandom(edit_attack_number_max));
	send_to_server();
}