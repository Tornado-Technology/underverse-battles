/// @description Gravity down
set_angle(dir.right);

// Input
right = input_check_held(input.right);
left = input_check_held(input.left);
up = input_check_held(input.up) && !input_check_held(input.down);

var HSPD = speed_const * dtime;
var VSPD = vertical_speed_const * dtime;
var FALL_SPD = 3 * dtime;

var has_collision_with_platform = place_meeting(x, y + 1, obj_platform) && !place_meeting(x, y, obj_platform);

if (blue_attack) blue_attack_force_speed_y = 5 * dtime;

if (has_collision_with_platform && movement_speed_y >= 0) {
	platform_inertion = instance_place(x, y + 1, obj_platform).speed;
	is_jumping = false;
	fly_time = 0;
	movement_speed_y = 0;
	blue_attack_force_speed_y = 0;
	
	if (obj_platform._angle == 90) {
		blue_attack_force_speed_y = -obj_platform.const_speed;
	}
	if (obj_platform._angle == 270) {
		outside_force_y = obj_platform.const_speed * 2;
	}
} else {
	platform_inertion = 0;
}

if (right) {
	movement_speed_x = HSPD;
}

if (left) {
	movement_speed_x = -HSPD;
}

// Collision

if (has_collision_down) {
	is_jumping = false;
	fly_time = 0;
	movement_speed_y = 0;
	blue_attack_force_speed_y = 0;
}

// Jump
if (up && !is_jumping && fly_time == 0) {
	is_jumping = true;
}

if (up && is_jumping && fly_time < max_fly_time) {
	movement_speed_y = -VSPD;
	fly_time += dtime;
}
else {
	movement_speed_y += grav * dtime * dtime;
	fly_time += dtime;
}
if (!up && movement_speed_y < 0 || has_collision_up && !has_infinity_jump) {
	movement_speed_y = 0;
	is_jumping = false;
}

if (!left && !right) {
    movement_speed_x = 0;
}


// Platform
var full_movement_y = movement_speed_y + outside_force_y + tremble_force_y + border_force_y + blue_attack_force_speed_y;
if (place_meeting(x, y + full_movement_y, obj_platform) && !place_meeting(x, y, obj_platform) && full_movement_y >= 0) {
	while(!place_meeting(x, y + sign(full_movement_y) * movement_delta_min, obj_platform)) {
		y += sign(full_movement_y) * movement_delta_min;
	}
	fly_time = 0;
	blue_attack_force_speed_y = 0;
    movement_speed_y = 0;
	
	outside_force_y = 0;
	tremble_force_y = 0;	
}

if (movement_speed_y < -VSPD) {
	movement_speed_y = -VSPD;
}
if (movement_speed_y > FALL_SPD) {
	movement_speed_y = FALL_SPD;
}

x += movement_speed_x + outside_force_x + tremble_force_x + platform_inertion;
y += movement_speed_y + outside_force_y + tremble_force_y + blue_attack_force_speed_y;