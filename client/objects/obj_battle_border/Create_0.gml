depth = fight_depth.border;

_surface = -1;

x = battle_border.x + camera_get_view_x(view_camera[0]);
y = battle_border.y + camera_get_view_y(view_camera[0]);

up	  = battle_border.up;
down  = battle_border.down;
left  = battle_border.left;
right = battle_border.right;

speed_const = 0;
speed_spining = 0;

spining = false;

angle = 0;

alpha	 = 1;
alpha_bg = 1;
alpha_frame=1;

color    = c_white;
color_bg = c_black;
color_frame = c_white;

thickness_frame = 1;
thickness_frame_collision = 1;

enable_frame = true;

_inst_frame_up    = instance_create_depth(0, 0, 0, obj_solid);
_inst_frame_left  = instance_create_depth(0, 0, 0, obj_solid);
_inst_frame_down  = instance_create_depth(0, 0, 0, obj_solid);
_inst_frame_right = instance_create_depth(0, 0, 0, obj_solid);
_inst_frame_up.sprite_index	   = spr_pixel;
_inst_frame_left.sprite_index  = spr_pixel;
_inst_frame_down.sprite_index  = spr_pixel;
_inst_frame_right.sprite_index = spr_pixel;

// Dev
_point_x = 0;
_point_y = 0;
_angle = 0;
_bg_x = 0;
_bg_y = 0;
_bg_width = 0;
_bg_height = 0;
_surface_x = 0;
_surface_y = 0;
_surface_width = 0;
_surface_height = 0;
_frame_up_x = 0;
_frame_up_y = 0;
_frame_up_width = 0;
_frame_up_height = 0;
_frame_left_x = 0;
_frame_left_y = 0;
_frame_left_width = 0;
_frame_left_height = 0;
_frame_down_x = 0;
_frame_down_y = 0;
_frame_down_width = 0;
_frame_down_height = 0;
_frame_right_x = 0;
_frame_right_y = 0;
_frame_right_width = 0;
_frame_right_height = 0;