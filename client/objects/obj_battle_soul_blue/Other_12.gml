/// @description gravity left

right = input_check_held(input.down);
left = input_check_held(input.up);
up = input_check_held(input.right) && !input_check_held(input.left);

var HSPD = 1.8;
var VSPD = 2.5;
var FALL_SPD = 3;

image_angle = dir.down;
collider_soul.image_angle = dir.down;
    
if (place_meeting(x - 1, y, obj_solid))
{
    hspd = 0;
	fly_time = 0;
	addit_spd = 0;
}
else if (place_meeting(x - 1, y, obj_platform) and !place_meeting(x, y, obj_platform) and hspd >= 0) {
	vspd_inert = instance_place(x - 1, y, obj_platform).speed;
	fly_time = 0;
	addit_spd = 0;
	hspd = 0;
}
else {
	vspd_inert = 0;
    hspd -= (grav + addit_spd);
}
        
if (hspd < -FALL_SPD - addit_spd)
	hspd = (-FALL_SPD - addit_spd);
    
if (right)
    vspd = HSPD;
if (left)
    vspd = -HSPD;
if (up and fly_time < max_fly_time and (place_meeting(x - 1, y, obj_solid) or (place_meeting(x - 1, y, obj_platform) and !place_meeting(x, y, obj_platform) and hspd >= 0))) {
	hspd = VSPD;
	fly_time += dtime;
}
if (!up and hspd > 0)
	hspd = 0;
if (!left and !right)
    vspd = 0;
    
//vertical
if (place_meeting(x + hspd, y, obj_solid)) {
    while (!place_meeting(x + sign(hspd), y, obj_solid))
        x += sign(hspd);
	fly_time = 0;
	addit_spd = 0;
    hspd = 0;
}
//obj_platform
if (place_meeting(x + hspd, y, obj_platform) and !place_meeting(x, y, obj_platform) and hspd >= 0) {
    while (!place_meeting(x + sign(hspd), y, obj_platform))
        x += sign(hspd);
	fly_time = 0;
	addit_spd = 0;
    hspd = 0;
}
x += hspd;
    
//horisontal
if (place_meeting(x, y + vspd + vspd_inert, obj_solid)) {
    while (!place_meeting(x, y + sign(vspd + vspd_inert), obj_solid))
        y += sign(vspd + vspd_inert);
    vspd = 0;
	vspd_inert = 0;
}
y += vspd + vspd_inert;
