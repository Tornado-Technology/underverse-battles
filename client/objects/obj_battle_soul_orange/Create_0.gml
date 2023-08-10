event_inherited();

is_dashing = false;
can_dash = false;
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

// Time sources
time_source_dash = time_source_create(time_source_game, 1/6, time_source_units_seconds, function () {
	invulnerability = false;
	is_dashing = false;
	movement_speed_x /= 2;
	movement_speed_y /= 2;
});
time_source_cooldown = time_source_create(time_source_game, 2/6, time_source_units_seconds, function () {
	can_dash = true;
});
time_source_start(time_source_cooldown);