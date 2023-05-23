/// @description gravity right
set_angle(dir.up);

right = input_check_held(input.down);
left = input_check_held(input.up);
up = input_check_held(input.left) && !input_check_held(input.right);

var HSPD = 1.8;
var VSPD = 2.5;
var FALL_SPD = 3;
    
if (place_meeting(x + 1, y, obj_platform) and !place_meeting(x, y, obj_platform) and hspd >= 0) {
	vspd_inert = instance_place(x + 1, y, obj_platform).speed;
	fly_time = 0;
	addit_spd = 0;
	hspd = 0;
}
else {
	vspd_inert = 0;
    hspd += (grav + addit_spd);
}
        
if (hspd > FALL_SPD + addit_spd)
    hspd = (FALL_SPD + addit_spd);
    
if (right)
    vspd = HSPD;
if (left)
    vspd = -HSPD;
if (up and fly_time < max_fly_time and (place_meeting(x + 1, y, obj_solid) or (place_meeting(x + 1, y, obj_platform) and !place_meeting(x, y, obj_platform) and hspd >= 0))) {
	hspd = -VSPD;
	fly_time ++;
}
if (!up and hspd < 0)
	hspd = 0;
if (!left and !right)
    vspd = 0;
	
var movement_delta_min = 0.01;
    
// Horisontal
var full_movement_x = hspd;
if (place_meeting(x + full_movement_x, y, obj_solid)) {
	while(!place_meeting(x + sign(full_movement_x) * movement_delta_min, y, obj_solid)) {
		x += sign(full_movement_x) * movement_delta_min;
	}
	
	fly_time = 0;
	hspd = 0;
	addit_spd = 0;
}

// Platform
var full_movement_x = hspd;
if (place_meeting(x + full_movement_x, y, obj_platform) and !place_meeting(x, y, obj_platform) and full_movement_x >= 0) {
    while(!place_meeting(x + sign(full_movement_x) * movement_delta_min, y, obj_platform)) {
		x += sign(full_movement_x) * movement_delta_min;
	}
	
	fly_time = 0;
	addit_spd = 0;
    hspd = 0;
}
x += hspd;
    
// Vertical
var full_movement_y = vspd + vspd_inert;
if (place_meeting(x, y + full_movement_y, obj_solid)) {
	while(!place_meeting(x, y + sign(full_movement_y) * movement_delta_min, obj_solid)) {
		y += sign(full_movement_y) * movement_delta_min;
	}
	
	fly_time = 0;
	addit_spd = 0;
    vspd = 0;
}
y += vspd + vspd_inert;