event_inherited();

_period = 1;

bone_obj = obj_bone_cross;
bone_spin_obj = obj_bone_rotating_cross;
bone_topref_obj = obj_bone_topref_cross;
gb_obj = obj_gasterblaster_cross;
aim_gb_obj = obj_gasterblaster_aiming_cross;
knife_directed_obj = obj_knife_directed_cross;

rand_num = 0;
_bones = [];
_platforms = [];
first = [];
last = [];
knife = noone;
_shift = 0;

num = 0;

_side = 90;
step = 5;
rot = 0;

event_user(4);
event_user(5);