draw_reset();

var color = make_color_rgb(75, 0, 0);

gpu_set_blendmode_ext(bm_src_colour, bm_one);
draw_rectangle_color(obj_camera.x, obj_camera.y, obj_camera.x + obj_camera.view_width, obj_camera.y + obj_camera.view_height, color, color, color, color, false);

gpu_set_blendmode(bm_normal);
draw_reset();