if (speed_max <= speed_const) {
	speed_max = approach(speed_max, speed_const, step * dtime);
};
var radius = sprite_height -  35;
platform.x = x  + dcos(image_angle) * radius;
platform.y = y + -dsin(image_angle) * radius;


image_angle += speed_max * dtime;	