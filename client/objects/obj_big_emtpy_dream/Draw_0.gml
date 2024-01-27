var px1 = (border_instance.x - border_instance.left) + center_empty;
var px2 = (border_instance.x + border_instance.right) - center_empty;
var py1 = (border_instance.y - border_instance.up) + center_empty;
var py2 = (border_instance.y + border_instance.down) - center_empty;

 surface = surface_create(room_width, room_height);		
if (!surface_exists(surface)) {
	surface = surface_create(room_width, room_height);		
}
surface_set_target(surface)
draw_rectangle(px1, py1 , px2 , py2, false);
depth = fight_depth.bullet_outside;
surface_reset_target();

draw_surface_ext(surface, 0, 0, 1, 1, image_angle, c_black, 1);