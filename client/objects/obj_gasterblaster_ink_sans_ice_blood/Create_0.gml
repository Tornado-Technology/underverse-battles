fly_step_const = 0.2;
flyout_step_const = 0.05;

// Positions
if (!variable_instance_exists(id, "final_position_x")) final_position_x = 0;
if (!variable_instance_exists(id, "final_position_y")) final_position_y = 0;
if (!variable_instance_exists(id, "target_x")) target_x = 0;
if (!variable_instance_exists(id, "target_y")) target_y = 0;

// Time
if (!variable_instance_exists(id, "fly_time")) fly_time = 1/6;
if (!variable_instance_exists(id, "charge_time")) charge_time = 0.5;
if (!variable_instance_exists(id, "flyout_time")) flyout_time = 5/12;
if (!variable_instance_exists(id, "destroy_time")) destroy_time = 1/6;

// Options
is_shaked = false;

// Sprites
charge_sprite = spr_gasterblaster_charging_sans;
shot_sprite = spr_gasterblaster_shooting_sans;

// Objects
blast_object = obj_gb_blast_ink_sans_ice_blood;
charge_object = obj_gb_charge_ink_sans_ice_blood;

// Instances
charge_instance = noone;
blast_instance = noone;

// Sounds
charge_sound = snd_gb_charge1;
shot_sound = snd_gb_shot;

// Time sources
event_user(0);