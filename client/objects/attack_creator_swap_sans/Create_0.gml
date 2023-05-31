event_inherited();

_period = 1;

bone_obj = obj_bone_swap_sans;
bone_orange_obj = obj_bone_orange_swap_sans;
bone_spin_obj = obj_bone_rotating_swap_sans;
bone_sharp_obj = obj_bone_sharp_swap_sans
gb_obj = obj_gasterblaster_swap_sans;
aim_gb_obj = obj_gasterblaster_aiming_swap_sans;

rand_num = 0;
_bones = [];
_shift = 0;

num = 0;

event_user(4);
event_user(5);
if (_id > -1 && _id < 4) event_user(_id);