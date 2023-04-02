image_angle = _target_angle; 
motion_set(image_angle, speed_const * dtime);

part_type_color1(part_type_tail, choose(c_white, c_ltgray, c_gray));
part_type_orientation(part_type_tail, image_angle, image_angle, 0, 0, false);
part_particles_create(global.part_system_bullet, x, y, part_type_tail, 1);