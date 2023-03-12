_id = 0;
_power = 0;
_time = 0;
_period = 1;
stage = 0;
attack_num = 0;

character_instance = noone;

bone_obj = obj_bone_sans;
gb_obj = obj_gasterblaster_sans;
aim_gb_obj = obj_gasterblaster_aiming_sans;

_bones = [];
_platforms = [];
first = [];
last = [];
_shift = 0;
wave_time = random_range(0, 2*pi);

_soul = noone;
_border = noone;

side = dir.left;
num = 0;
bone_scale_speed = 0.3;
new_warning = false;

_angle = 0;
angle_step = 0;