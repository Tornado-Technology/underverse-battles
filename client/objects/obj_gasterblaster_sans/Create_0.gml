x_dir = x;
y_dir = y;

step = 0.1;

started = false;

fly_time = 1/6;
//charge_time = 0.5;
//flyout_time = 5/12;
//destroy_time = 1/6;
charge_time = 1;
flyout_time = 15/60;
destroy_time = 1/6;

charge_sprite = spr_gasterblaster_charging_sans;
shot_sprite = spr_gasterblaster_shooting_sans;

blast_object = obj_gb_blast_sans;
charge_object = obj_gb_charge_sans;

charge_instance = noone;
blast_instance = noone;

is_shaked = false;

// Time sources
event_user(0);