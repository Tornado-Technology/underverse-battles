event_inherited();

bone_obj = obj_bone_sans;
gb_obj = obj_gasterblaster_sans;
aim_gb_obj = obj_gasterblaster_aiming_sans;

_bones = [];
_shift = 0;
wave_time = random_range(0, 2*pi);

_period = 1;
side = dir.left;
num = 0;
bone_scale = 1;
new_warning = false;

_angle = 0;
angle_step = 0;

event_user(4);
event_user(5);