event_inherited();

moveable = true;

movement_speed_x = 0;
movement_speed_y = 0;

outside_force_x = 0;
outside_force_y = 0;

is_stunned = false;

is_dashing = false;
delay_ = 10;
invulnerability = false;

side = 0;
changeable_direction = false;

new_image_angle = 0;


is_changing_side = false;
side_controller = undefined;
side_controller_previous = undefined;

// Particle
part_type_tail = part_type_create();
part_type_sprite(part_type_tail, sprite_index, false, false, false);
part_type_alpha2(part_type_tail, 1, 0);
part_type_life(part_type_tail, 20, 20);