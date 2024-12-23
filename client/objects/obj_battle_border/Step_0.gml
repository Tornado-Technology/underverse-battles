speed = speed_const * dtime;

_angle = angle;
image_angle = angle;
if (spining) {
	angle += speed_spining * dtime;	
};

// Position
_point_x = x - left;
_point_y = y - up;

event_user(0);

// Bg
_bg_x = _point_x;
_bg_y = _point_y;
_bg_width  = left + right;
_bg_height = down + up;

_surface_x = x - left;
_surface_y = y - up;
_surface_width  = left + right;
_surface_height = down + up;

if (enable_frame) {
	_point_x=x-left-thickness_frame_collision;
	_point_y=y-up-thickness_frame_collision;
	event_user(0);
	_frame_up_x=_point_x;
	_frame_up_y=_point_y;
	_frame_up_width=left+right+thickness_frame_collision*2;
	_frame_up_height=thickness_frame_collision;
	
	_point_x=x-left-thickness_frame_collision;
	_point_y=y-up-thickness_frame_collision;
	event_user(0);
	_frame_left_x=_point_x;
	_frame_left_y=_point_y;
	_frame_left_width=thickness_frame_collision;
	_frame_left_height=up+down+thickness_frame_collision*2;

	_point_x=x-left-thickness_frame_collision;
	_point_y=y+down;
	event_user(0);
	_frame_down_x=_point_x;
	_frame_down_y=_point_y;
	_frame_down_width=left+right+thickness_frame_collision*2;
	_frame_down_height=thickness_frame_collision;

	_point_x=x+right;
	_point_y=y-up-thickness_frame_collision;
	event_user(0);
	_frame_right_x=_point_x;
	_frame_right_y=_point_y;
	_frame_right_width=thickness_frame_collision;
	_frame_right_height=up+down+thickness_frame_collision*2;
	
	
	_inst_frame_up.x=_frame_up_x;
	_inst_frame_up.y=_frame_up_y;
	_inst_frame_up.image_angle=_angle;
	_inst_frame_up.image_xscale=_frame_up_width;
	_inst_frame_up.image_yscale=_frame_up_height;
	
	_inst_frame_down.x=_frame_down_x;
	_inst_frame_down.y=_frame_down_y;
	_inst_frame_down.image_angle=_angle;
	_inst_frame_down.image_xscale=_frame_down_width;
	_inst_frame_down.image_yscale=_frame_down_height;
	
	_inst_frame_left.x=_frame_left_x;
	_inst_frame_left.y=_frame_left_y;
	_inst_frame_left.image_angle=_angle;
	_inst_frame_left.image_xscale=_frame_left_width;
	_inst_frame_left.image_yscale=_frame_left_height;
	
	_inst_frame_right.x=_frame_right_x;
	_inst_frame_right.y=_frame_right_y;
	_inst_frame_right.image_angle=_angle;
	_inst_frame_right.image_xscale=_frame_right_width;
	_inst_frame_right.image_yscale=_frame_right_height;
}else{
	_inst_frame_up.image_xscale=0;
	_inst_frame_up.image_yscale=0;
	_inst_frame_left.image_xscale=0;
	_inst_frame_left.image_yscale=0;
	_inst_frame_down.image_xscale=0;
	_inst_frame_down.image_yscale=0;
	_inst_frame_right.image_xscale=0;
	_inst_frame_right.image_yscale=0;
	
}


_point_x=x-left-thickness_frame;
_point_y=y-up-thickness_frame;
event_user(0);
_frame_up_x=_point_x;
_frame_up_y=_point_y;
_frame_up_width=left+right+thickness_frame*2;
_frame_up_height=thickness_frame;


_point_x=x-left-thickness_frame;
_point_y=y-up-thickness_frame;
event_user(0);
_frame_left_x=_point_x;
_frame_left_y=_point_y;
_frame_left_width=thickness_frame;
_frame_left_height=up+down+thickness_frame*2;


_point_x=x-left-thickness_frame;
_point_y=y+down;
event_user(0);
_frame_down_x=_point_x;
_frame_down_y=_point_y;
_frame_down_width=left+right+thickness_frame*2;
_frame_down_height=thickness_frame;


_point_x=x+right;
_point_y=y-up-thickness_frame;
event_user(0);
_frame_right_x=_point_x;
_frame_right_y=_point_y;
_frame_right_width=thickness_frame;
_frame_right_height=up+down+thickness_frame*2;