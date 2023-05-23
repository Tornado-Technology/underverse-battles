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

/// @param {Real} angle
change_gravity_force = function(angle) {
	gravity_force = angle;
	max_fly_time = 60;
	fly_time = max_fly_time;
	blue_attack = true;
	addit_spd = 5;
}
