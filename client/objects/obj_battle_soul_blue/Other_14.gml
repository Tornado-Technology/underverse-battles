/// @description Gravity up
set_angle(dir.left);

// Input
right = input_check_held(input.right);
left = input_check_held(input.left);
up = input_check_held(input.down) && !input_check_held(input.up);

var HSPD = 1.8 * dtime;
var VSPD = 2.5 * dtime;
var FALL_SPD = 3 * dtime;

if (blue_attack) blue_attack_force_speed_y = -5 * dtime;

if (place_meeting(x, y - 1, obj_platform) && !place_meeting(x, y, obj_platform) && movement_speed_y <= 0) {
	platform_inertion = instance_place(x, y - 1, obj_platform).speed;
	is_jumping = false;
	fly_time = 0;
	movement_speed_y = 0;
	blue_attack_force_speed_y = 0;
} else {
	platform_inertion = 0;
}

if (right) {
    movement_speed_x = HSPD;
}

if (left) {
    movement_speed_x = -HSPD;
}

// Jump
if (up && !is_jumping && fly_time == 0) {
	is_jumping = true;
}

if (up && is_jumping && fly_time < max_fly_time) {
	movement_speed_y = VSPD;
	fly_time += dtime;
}
else if (!up && movement_speed_y > 0 || has_collision_down) {
	movement_speed_y = 0;
}
else {
	movement_speed_y -= grav * dtime * dtime;
}

if (has_collision_up) {
	is_jumping = false;
	fly_time = 0;
	movement_speed_y = 0;
	blue_attack_force_speed_y = 0;
}

if (!left && !right) {
    movement_speed_x = 0;
}

// Platform
var full_movement_y = movement_speed_y + outside_force_y + tremble_force_y + border_force_y + blue_attack_force_speed_y;
if (place_meeting(x, y + full_movement_y, obj_platform) && !place_meeting(x, y, obj_platform) && full_movement_y <= 0) {
	while(!place_meeting(x, y + sign(full_movement_y) * movement_delta_min, obj_platform)) {
		y += sign(full_movement_y) * movement_delta_min;
	}
	
	fly_time = 0;
	blue_attack_force_speed_y = 0;
    movement_speed_y = 0;
	
	outside_force_y = 0;
	tremble_force_y = 0;
}

if (movement_speed_y < -FALL_SPD) {
	movement_speed_y = -FALL_SPD;
}

x += movement_speed_x + outside_force_x + tremble_force_x + border_force_x + platform_inertion;
y += movement_speed_y + outside_force_y + tremble_force_y + border_force_y + blue_attack_force_speed_y;