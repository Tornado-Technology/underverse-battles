/// @description gravity up

right = input_check_held(input.right);
left = input_check_held(input.left);
up = input_check_held(input.down) && !input_check_held(input.up);

var HSPD = 1.8;
var VSPD = 2.5;
var FALL_SPD = 3;

image_angle = dir.left;
collider_soul.image_angle = dir.left;
    
if (place_meeting(x, y - 1, obj_solid)) {
    vspd = 0;
	fly_time = 0;
	addit_spd = 0;
} else if (place_meeting(x, y - 1, obj_platform) and !place_meeting(x, y, obj_platform) and vspd >= 0) {
	hspd_inert = instance_place(x, y - 1, obj_platform).speed;
	fly_time = 0;
	addit_spd = 0;
	vspd = 0;
} else {
	hspd_inert = 0;
    vspd -= (grav + addit_spd) * dtime;
}
        
if (vspd < -FALL_SPD - addit_spd) {
	vspd = (-FALL_SPD - addit_spd) * dtime;
}

if (right) {
    hspd = HSPD * dtime;
}

if (left) {
    hspd = -HSPD * dtime;
}

if (up && fly_time < max_fly_time and (place_meeting(x, y - 1, obj_solid) or (place_meeting(x, y - 1, obj_platform) and !place_meeting(x, y, obj_platform) and vspd >= 0))) {
	vspd = VSPD * dtime;
	fly_time += dtime;
}

if (!up && vspd > 0) {
	vspd = 0;
}

if (!left && !right) {
    hspd = 0;
}

// Vertical
if (place_meeting(x, y + vspd, obj_solid)) {
    while (!place_meeting(x , y + sign(vspd), obj_solid)) {
        y += sign(vspd);
	}
	
	fly_time = 0;
	addit_spd = 0;
    vspd = 0;
}

// Platform 
if (place_meeting(x, y + vspd, obj_platform) && !place_meeting(x, y, obj_platform) && vspd >= 0) {
    while (!place_meeting(x , y + sign(vspd), obj_platform)) {
        y += sign(vspd);
	}
	
	fly_time = 0;
	addit_spd = 0;
    vspd = 0;
}

y += vspd;
 
// Horisontal
if (place_meeting(x + hspd + hspd_inert, y, obj_solid)) {
    while (!place_meeting(x + sign(hspd + hspd_inert), y, obj_solid)) {
        x += sign(hspd + hspd_inert);
	}
	
    hspd = 0;
	hspd_inert = 0;
}

x += hspd + hspd_inert;
