event_inherited();
depth = fight_depth.bullet_outside_hight;

started = false;

step = 0.4;

target_x = x;
target_y = y;

fly_time = 1/6;

idle_sprite = spr_gasterblaster_green;
charge_sprite = spr_gasterblaster_charging_green;
shot_sprite = spr_gasterblaster_shooting_green;

blast_object = obj_gb_blast_green;
charge_object = obj_gb_charge_green;

is_shaked = false;

edit_particle_count = 50;
edit_particle_distance = 25;

// Time sources
event_user(0);