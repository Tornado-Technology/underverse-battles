radius += line_speed / 30;
_angle += angle_speed;
			
angle_speed = base_angle_speed / radius;
			
x += lengthdir_x(radius, _angle);
y += lengthdir_y(radius, _angle);

image_angle += line_speed + angle_speed;
