_id = 0;
_power = 0;
_time = 0;
_period = 1;
attack_num = 0;

character_instance = noone;

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

_soul = noone;
_border = noone;

new_warning = false;