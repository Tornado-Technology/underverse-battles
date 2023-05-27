event_inherited();

_period = 1;

bone_obj = obj_bone_fell_sans;
gb_obj = obj_gasterblaster_fell_sans;
aim_gb_obj = obj_gasterblaster_aiming_fell_sans;
spin_bone_obj = obj_bone_spinning_fell_sans;

_bones = [];
_platforms = [];
first = [];
last = [];
_shift = 0;
wave_time = random_range(0, 2*pi);

new_warning = false;

_angle = 0;
angle_step = 0;

event_user(4);
event_user(5);
if (_id > -1 && _id < 4) event_user(_id);