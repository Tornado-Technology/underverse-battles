/// @description gravity up
set_angle(dir.left);

right = input_check_held(input.right);
left = input_check_held(input.left);
up = input_check_held(input.down) && !input_check_held(input.up);

var HSPD = 1.8;
var VSPD = 2.5;
var FALL_SPD = 3;
    
if (place_meeting(x, y - 1, obj_platform) and !place_meeting(x, y, obj_platform) and vspd >= 0) {
	hspd_inert = instance_place(x, y - 1, obj_platform).speed;
	fly_time = 0;
	addit_spd = 0;
	vspd = 0;
} else {
	hspd_inert = 0;
    vspd -= (grav + addit_spd);
}
        
if (vspd < -FALL_SPD - addit_spd) {
	vspd = (-FALL_SPD - addit_spd);
}

if (right) {
    hspd = HSPD;
}

if (left) {
    hspd = -HSPD;
}

if (up && fly_time < max_fly_time and (place_meeting(x, y - 1, obj_solid) or (place_meeting(x, y - 1, obj_platform) and !place_meeting(x, y, obj_platform) and vspd >= 0))) {
	vspd = VSPD;
	fly_time++;
}

if (!up && vspd > 0) {
	vspd = 0;
}

if (!left && !right) {
    hspd = 0;
}

var movement_delta_min = 0.01;

// Vertical
var full_movement_y = vspd;
if (place_meeting(x, y + full_movement_y, obj_solid)) {
	while(!place_meeting(x, y + sign(full_movement_y) * movement_delta_min, obj_solid)) {
		y += sign(full_movement_y) * movement_delta_min;
	}
	
	fly_time = 0;
	addit_spd = 0;
    vspd = 0;
}

// Platform 
var full_movement_y = vspd;
if (place_meeting(x, y + full_movement_y, obj_platform) && !place_meeting(x, y, obj_platform) && full_movement_y >= 0) {
	while(!place_meeting(x, y + sign(full_movement_y) * movement_delta_min, obj_platform)) {
		y += sign(full_movement_y) * movement_delta_min;
	}
	
	fly_time = 0;
	addit_spd = 0;
    vspd = 0;
}
y += vspd;
 
// Horisontal
var full_movement_x = hspd + hspd_inert;
if (place_meeting(x + full_movement_x, y, obj_solid)) {
	while(!place_meeting(x + sign(full_movement_x) * movement_delta_min, y, obj_solid)) {
		x += sign(full_movement_x) * movement_delta_min;
	}
	
	hspd = 0;
	hspd_inert = 0;
}
x += hspd + hspd_inert;
