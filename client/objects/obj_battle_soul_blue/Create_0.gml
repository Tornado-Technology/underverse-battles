event_inherited();

moveable = true;

hspd = 0;
hspd_inert = 0;

vspd = 0;
vspd_inert = 0;

grav = 0.05;

right = false;
left = false;
up = false;
down = false;

HSPD = 1.8;
VSPD = 2.5;
FALL_SPD = 3;

fly_time = 60;
max_fly_time = 60;

gravity_force = dir.down;
addit_spd = 0;

blue_attack = false;

/// @param {Real} angle
set_angle = function(angle) {
	image_angle = angle;
	collider_soul.image_angle = angle;
}
