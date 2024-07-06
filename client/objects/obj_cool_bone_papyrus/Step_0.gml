x = skate.x;
y = (ystart - 25) - (dsin(angle) * radius);

if (dsin(angle) >= dsin(5)) {
	image_angle += dsin(angle) * 21; 
};

angle += speed_const * dtime;