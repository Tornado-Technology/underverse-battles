step = 0.1;

started = false;

//charge_time = 0.5;
//flyout_time = 5/12;
//destroy_time = 1/6;

charge_sprite = spr_gasterblaster_charging_sans;
shot_sprite = spr_gasterblaster_shooting_sans;

blast_object = obj_gb_blast_sans;
charge_object = obj_gb_charge_sans;

charge_instance = noone;
blast_instance = noone;

is_shaked = false;

// Sounds
charge_sound = snd_gb_charge1;
shot_sound = snd_gb_shot;

// Time sources
event_user(0);