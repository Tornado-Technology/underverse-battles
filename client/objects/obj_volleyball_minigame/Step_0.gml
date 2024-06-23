if (!waiting_player_punch || !input_check_pressed(input.action)) exit;

on_round_start.invoke();
frisk.punch();
waiting_player_punch = false;