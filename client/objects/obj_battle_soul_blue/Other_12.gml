/// @description Gravity left
set_angle(dir.down);

// Input
right = input_check_held(input.down);
left = input_check_held(input.up);
up = input_check_held(input.right) && !input_check_held(input.left);

var HSPD = speed_const * dtime;
var VSPD = 2.5 * dtime;
var FALL_SPD = 3 * dtime;

if (blue_attack) blue_attack_force_speed_x = -5 * dtime;

if (place_meeting(x - 1, y, obj_platform) && !place_meeting(x, y, obj_platform) && movement_speed_x <= 0) {
	platform_inertion = instance_place(x - 1, y, obj_platform).speed;
	is_jumping = false;
	fly_time = 0;
	movement_speed_y = 0;
	blue_attack_force_speed_y = 0;
} else {
	platform_inertion = 0;
}
    
if (right) {
    movement_speed_y = HSPD;
}

if (left) {
    movement_speed_y = -HSPD;
}

// Jump
if (up && !is_jumping && fly_time == 0) {
	is_jumping = true;
}

if (up && is_jumping && fly_time < max_fly_time) {
	movement_speed_x = VSPD;
	fly_time += dtime;
}
else {
	movement_speed_x -= grav * dtime * dtime;
}
if (!up && movement_speed_x > 0 || has_collision_right) {
	movement_speed_x = 0;
	is_jumping = false;
}

if (has_collision_left) {
	is_jumping = false;
	fly_time = 0;
	movement_speed_x = 0;
	blue_attack_force_speed_x = 0;
}

if (!left && !right) {
    movement_speed_y = 0;
}

// Platform
var full_movement_x = movement_speed_x + outside_force_x + tremble_force_x + border_force_x + blue_attack_force_speed_x;
if (place_meeting(x + full_movement_x, y, obj_platform) && !place_meeting(x, y, obj_platform) && full_movement_x <= 0) {
    while(!place_meeting(x + sign(full_movement_x) * movement_delta_min, y, obj_platform)) {
		x += sign(full_movement_x) * movement_delta_min;
	}
	
	fly_time = 0;
	blue_attack_force_speed_x = 0;
    movement_speed_x = 0;
	
	outside_force_x = 0;
	tremble_force_x = 0;
}

if (movement_speed_x < -FALL_SPD) {
	movement_speed_x = -FALL_SPD;
}

x += movement_speed_x + outside_force_x + tremble_force_x + blue_attack_force_speed_x;
y += movement_speed_y + outside_force_y + tremble_force_y + platform_inertion;