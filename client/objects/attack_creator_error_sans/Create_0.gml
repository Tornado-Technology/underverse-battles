event_inherited();

stage = 0;

bone_obj = obj_bone_error_sans;
bone_sharp_obj = obj_bone_sharp_error_sans;
aim_gb_obj = obj_gasterblaster_aiming_error_sans;
gb_obj = obj_gasterblaster_error_sans;

_bones = [];
_platforms = [];
first = [];
last = [];
_shift = 0;

new_warning = false;

num = 0;

event_user(4);
event_user(5);
if (_id > -1 && _id < 4) event_user(_id);