draw_set_alpha(1);

draw_sprite(spr_background_doodle_sphere_layer_0, 0, 0, 0);

draw_set_alpha(0.36);
draw_sprite(spr_background_doodle_sphere_layer_3, 0, 0, wave(-4, 0, 7, 3));

draw_set_alpha(0.58);
draw_sprite(spr_background_doodle_sphere_layer_2, 0, 0, wave(-10, 0, 15, 2));

draw_set_alpha(1);
draw_sprite(spr_background_doodle_sphere_layer_1, 0, 0, wave(-7, 0, 10));

draw_sprite(spr_background_doodle_sphere_platform, 0, platform_position_1.x, platform_position_1.y - 1);
draw_sprite_ext(spr_background_doodle_sphere_platform, 0, platform_position_2.x, platform_position_2.y - 1, -1, 1, 0, c_white, 1);

draw_set_alpha(1);
	