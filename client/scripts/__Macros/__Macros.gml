// Self things
#macro sprite_aspect  (sprite_width / sprite_height)
#macro sprite_unwidth (sprite_get_width(sprite_index))
#macro sprite_unheight (sprite_get_height(sprite_index))
#macro sprite_unaspect  (sprite_unwidth / sprite_unheight)

#macro sprite_width_center (sprite_width / 2 - sprite_xoffset)
#macro sprtie_height_center (sprite_height / 2 -sprite_yoffset)

#macro sprite_edge_left (-sprite_xoffset)
#macro sprite_edge_top  (-sprite_yoffset)
#macro sprite_edge_right (sprite_width - 1 - sprite_xoffset)
#macro sprite_edge_bottom (sprite_height - 1 - sprite_yoffset)

#macro xdelta (x - xprevious)
#macro ydelta (y -yprevious)

#macro is_desktop (os_type == os_windows || os_type == os_linux || os_type == os_macosx)
#macro is_mobile (os_type == os_android || os_type == os_ios || mobile_mode)
#macro is_html (os_browser != browser_not_a_browser)

#macro mouse_gui_x (device_mouse_x_to_gui(0))
#macro mouse_gui_y (device_mouse_y_to_gui(0))

#macro real_delta_time (delta_time / 1000000)

#macro struct_empty {}
#macro array_empty []
#macro string_empty ""
#macro function_empty function() {}
