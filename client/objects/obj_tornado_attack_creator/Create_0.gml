event_inherited();

// Main battle intances
border_instance = noone;
soul_instance = noone;

// Attack 0 - Cup
use_heal = false;
instance_cup = noone;
instance_tea = noone;

created_scythe = false;

event_user(4);
event_user(5);
if (_id > -1 && _id < 4) event_user(_id);
