event_inherited();

random_type = irandom_range(0, 3);

if (random_type == 0) {
	charge_sprite = spr_gasterblaster_charging_sans;
	shot_sprite = spr_gasterblaster_shooting_sans;
}
if (random_type == 1) {
	sprite_index = spr_gasterblaster_fell_sans;
	charge_sprite = spr_gasterblaster_charging_fell_sans;
	shot_sprite = spr_gasterblaster_shooting_fell_sans;
}
if (random_type == 2) {
	sprite_index = spr_gasterblaster_swap_sans;
	charge_sprite = spr_gasterblaster_charging_swap_sans;
	shot_sprite = spr_gasterblaster_shooting_swap_sans;
}
if (random_type == 3) {
	sprite_index = spr_gasterblaster_cross;
	charge_sprite = spr_gasterblaster_charging_cross;
	shot_sprite = spr_gasterblaster_shooting_cross;
}

blast_object = obj_gb_blast_green;
charge_object = obj_gb_charge_green;

edit_color = c_green;
edit_particle_count = 50;
edit_particle_distance = 25;
edit = destroy_by_edit;