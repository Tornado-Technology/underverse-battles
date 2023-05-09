event_inherited();

_period = 1;

bone_obj = obj_bone_cross_xevent;
bone_spin_obj = obj_bone_rotating_cross_xevent;
bone_topref_obj = obj_bone_topref_cross_xevent;
gb_obj = obj_gasterblaster_cross_xevent;
aim_gb_obj = obj_gasterblaster_aiming_cross_xevent;
knife_directed_obj = obj_knife_directed_cross_xevent;

rand_num = 0;
_bones = [];
_platforms = [];
first = [];
last = [];
knife = noone;
_shift = 0;

num = 0;

event_user(4);
event_user(5);