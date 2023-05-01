event_inherited();
depth = fight_depth.bullet_outside_hight;

started = false;

step = 0.4;

x_dir = x;
y_dir = y;

fly_time = 1/6;
//target_time = 0.3;
//charge_time = 0.5;
//destroy_time = 1/6;

idle_sprite = spr_gasterblaster_green;
charge_sprite = spr_gasterblaster_charging_green;
shot_sprite = spr_gasterblaster_shooting_green;

blast_object = obj_gb_blast_green;
charge_object = obj_gb_charge_green;

is_shaked = false;

// Particle
part_glitch = part_type_create();
part_type_shape(part_glitch, pt_shape_square);
part_type_color1(part_glitch, c_green);
part_type_alpha1(part_glitch, 0.5);
part_type_life(part_glitch, 5, 12);
part_type_orientation(part_glitch, image_angle, image_angle, 0, 0, false);
part_type_size(part_glitch, 0.05, 0.1, 0, 0);

edit = function() {
	var glitch_srpay = 25;
	repeat (50) part_particles_create(global.part_system_bullet, x + irandom_range(-glitch_srpay, glitch_srpay), y + irandom_range(-glitch_srpay, glitch_srpay), part_glitch, 1);
	instance_destroy();
}

// Time sources
event_user(0);