if(angle % 360 == 0) exit;
	
var target_x = _point_x;
var target_y = _point_y;

var center_x = x;
var center_y = y;

var rotate = -_angle;
	
var result_x = (target_x - center_x) * dcos(rotate) - (target_y - center_y) * dsin(rotate) + x;
var result_y = (target_y - center_y) * dcos(rotate) + (target_x - center_x) * dsin(rotate) + y;
	
_point_x = result_x;
_point_y = result_y;
