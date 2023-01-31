if (room != room_fight_end and room != room_fight_1v1_end) exit;

if (input_check_held(input.up))
	if (shift > 0) {
		shift -= 4;
	}
if (input_check_held(input.down))
	if (shift < array_length(selection_attacks_0) * 20 - 120) {
		shift += 4;
	}

if (mouse_wheel_up()) {
	scroll_up(3);
}

if (mouse_wheel_down()) {
	scroll_down(3);
}