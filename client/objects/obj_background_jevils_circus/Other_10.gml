var deg_dir = 360 / trimax;
var lendir_1 = rot + deg_dir * i;
var lendir_2 = rot + deg_dir * (i + 1);

newx1 = lengthdir_x(radius, lendir_1);
newx2 = lengthdir_x(radius, lendir_2);
newy1 = lengthdir_y(radius / 2, lendir_1);
newy2 = lengthdir_y(radius / 2, lendir_2);

if (newy1 <= 0) newy1 *= 0.6
if (newy2 <= 0) newy2 *= 0.6

draw_set_color(blackon ? c_dkblue2 : c_dkblue);
blackon = !blackon;