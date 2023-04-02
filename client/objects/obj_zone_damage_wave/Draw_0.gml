if (!show_zone)
	exit;

var dir = point_direction(x, y, x_side, y_side);
var rad = dir*pi/180;

draw_line_width_color(x, y, x + length*cos(rad) * dtime, y - length*sin(rad) * dtime, 2, c_red, c_red);