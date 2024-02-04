var edit_particle_count = 20;
var distance = 7;

part_glitch = part_type_create();
part_type_shape(part_glitch, pt_shape_square);
part_type_color1(part_glitch, c_green);
part_type_alpha1(part_glitch, 0.5);
part_type_life(part_glitch, 5, 12);
part_type_orientation(part_glitch, image_angle, image_angle, 0, 0, false);
part_type_size(part_glitch, 0.05, 0.1, 0, 0);

repeat (edit_particle_count) {
	part_particles_create(global.part_system_bullet_outside, x + irandom_range(-distance, distance), y + irandom_range(-distance, distance), part_glitch, 1);
}