event_inherited();

stage = 0;

bone_obj = obj_bone_swap_papyrus;
bone_orange_obj = obj_bone_orange_swap_papyrus;
gb_obj = obj_gasterblaster_swap_papyrus;
aim_gb_obj = obj_gasterblaster_aiming_swap_papyrus;

_bones = [];
bone_moving = noone;
bone_new = noone;
new_warning = false;
_shift = 0;

type = 0;
random_number = 0;

bone_scale = 1;
bone_size_update_0_0 = 1;

_angle = 0;
angle_step = 0;

event_user(4);
event_user(5);
if (_id > -1 && _id < 4) event_user(_id);