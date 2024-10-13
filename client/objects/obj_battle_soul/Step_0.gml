/// @desc Movement & Inv
if (follow_board) {
	var border = obj_battle_border;
	x += border.x - border.xprevious;
	y += border.y - border.yprevious;
}

var pusher = obj_battle_pusher;
if (place_meeting(x, y, pusher)) {
	pusher_instance = instance_place(x, y, pusher);
	var blast_angle = pusher_instance._angle;
	var cos_blast_angle = dcos(blast_angle);
	var sin_blast_angle = dsin(blast_angle);
	
	var outside_force_speed = pusher_instance.outside_force_speed * dtime;
	outside_force_x = outside_force_speed * cos_blast_angle;
	outside_force_y = -outside_force_speed * sin_blast_angle;
	
	is_pushed = true;
	
	movement_speed_x = 0;
	movement_speed_y = 0;
} else {
	pusher_instance = noone;
	
	outside_force_x = 0;
	outside_force_y = 0;
	is_pushed = false;
}

invincibility_update();
update_push_damage();
tremble_update();

ability = is_desktop ? input_check_held(input.skip) : input_check_held(input.action);
ability_pressed = is_desktop ? input_check_pressed(input.skip) : input_check_pressed(input.action);