event_inherited();

bone_obj = obj_bone_green;
spike_obj = obj_spear_green;
gb_obj = obj_turboblaster_green;
gb_aim_obj = obj_turboblaster_aiming_green;
knife_spin_obj = obj_knife_spin_green;
knife_directed_obj = obj_knife_directed_green;

edit_button = noone;
editing_object = [];

inst_turboblaster = noone;
_shift = 0;

new_warning = false;

x_start = 0;
y_start = 0;

border_decrease = 0;
first = false;

num = 0;
sum_num = 0;

_side = 90;
step = 6;
rot = irandom_range(0, 1);

event_user(4);
event_user(5);
if (_id > -1 && _id < 4) event_user(_id);