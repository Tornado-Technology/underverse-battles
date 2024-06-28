draw_reset();

draw_set_alpha(alpha);
draw_set_color(make_color_rgb(255, 220, 35));
gpu_set_blendmode_ext(bm_src_colour, bm_one);
draw_rectangle(obj_camera.x, obj_camera.y, obj_camera.x + obj_camera.view_width, obj_camera.y + obj_camera.view_height, false);

gpu_set_blendmode(bm_normal);
draw_reset();