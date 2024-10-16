/// @description Animation

if (!animating)
	exit;

time += dtime;
y = y0 + dsin(time) * animation_shift;

if (time >= 360) {
	time -= 360;
}