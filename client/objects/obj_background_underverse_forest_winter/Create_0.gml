sprite_index = noone;

part_emitter_snow = part_emitter_create(global.part_system_background);
part_emitter_region(global.part_system_background, part_emitter_snow, 0, room_width, 0, 0, ps_shape_line, ps_distr_linear);

part_type_snow = part_type_create();
part_type_sprite(part_type_snow, spr_pixel, false, false, false);
part_type_speed(part_type_snow, 0.1, 0.2, 0, 0);
part_type_direction(part_type_snow, 270, 270, 0, 45);
part_type_life(part_type_snow, 800, 1800);

part_emitter_stream(global.part_system_background, part_emitter_snow, part_type_snow, 1);