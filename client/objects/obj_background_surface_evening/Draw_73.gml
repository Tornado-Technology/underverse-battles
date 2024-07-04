draw_reset();

var camera_x = obj_camera.camera_position.x;
var camera_y = obj_camera.camera_position.y;

gpu_set_blendmode_ext(bm_src_colour, bm_one);
draw_set_color(make_color_rgb(100 * alpha, 76 * alpha, 0));
draw_rectangle(camera_x, camera_y, camera_x + obj_camera.view_width, camera_y + obj_camera.view_height, false);

gpu_set_blendmode(bm_normal);
draw_reset();