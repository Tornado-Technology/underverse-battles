/// @description Animation

if (!animating)
	exit;

time += dtime;

y = ystart + dsin(time) * animation_shift;

if (time >= 360) {
	time = 0;
}