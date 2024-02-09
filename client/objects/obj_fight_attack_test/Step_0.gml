// Exit
if (keyboard_check_pressed(vk_escape)) {
	room_goto(room_menu);
}

if (instance_exists(obj_battle)) exit;

// Change character
if (keyboard_check_pressed(vk_f1)) {
	if (selected_character == 0) exit;
	selected_character--;
	selected_skin = 0;
	instance_destroy(player[0]);
	player_object[0] = global.characters[selected_character, 0].object;
	player[0] = instance_create_depth(center_player_position_x[0], center_player_position_y[0], fight_depth.player, player_object[0]);
	player[0].mana = player[0].max_mana;
	player[0].special_action.percent = 100;
}
if (keyboard_check_pressed(vk_f2)) {
	if (selected_character == array_length(global.characters) - 1) exit;
	selected_character++;
	selected_skin = 0;
	instance_destroy(player[0]);
	player_object[0] = global.characters[selected_character, 0].object;
	player[0] = instance_create_depth(center_player_position_x[0], center_player_position_y[0], fight_depth.player, player_object[0]);
	player[0].mana = player[0].max_mana;
	player[0].special_action.percent = 100;
}

// Change skin
if (keyboard_check_pressed(vk_f3)) {
	if (selected_skin == 0) exit;
	selected_skin--;
	instance_destroy(player[0]);
	player_object[0] = global.characters[selected_character, selected_skin].object;
	player[0] = instance_create_depth(center_player_position_x[0], center_player_position_y[0], fight_depth.player, player_object[0]);
	player[0].mana = player[0].max_mana;
	player[0].special_action.percent = 100;
}
if (keyboard_check_pressed(vk_f4)) {
	if (selected_skin == array_length(global.characters[selected_character]) - 1) exit;
	selected_skin++;
	instance_destroy(player[0]);
	player_object[0] = global.characters[selected_character, selected_skin].object;
	player[0] = instance_create_depth(center_player_position_x[0], center_player_position_y[0], fight_depth.player, player_object[0]);
	player[0].mana = player[0].max_mana;
	player[0].special_action.percent = 100;
}

// Change FPS
if (keyboard_check_pressed(vk_f5)) {
	if (room_speed > room_speed_delta)
		room_speed -= room_speed_delta;
}
if (keyboard_check_pressed(vk_f6)) {
	if (room_speed < 60)
		room_speed += room_speed_delta;
}

// Change attack type
if (keyboard_check_pressed(vk_numpad0)) {
	type = 0;
}
if (keyboard_check_pressed(vk_numpad1)) {
	type = 1;
}
if (keyboard_check_pressed(vk_numpad2)) {
	type = 2;
}
if (keyboard_check_pressed(vk_numpad3)) {
	type = 3;
}
if (keyboard_check_pressed(vk_numpad4)) {
	type = 4;
}
if (keyboard_check_pressed(vk_numpad5)) {
	type = 5;
}