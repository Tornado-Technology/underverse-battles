/// @description Animation

if (!animating)
	exit;

if (y >= y0 and stage == 1)
	stage = 0;
if (stage == 0)
	y -= 0.1 * dtime;
if (y <= y0 - anim_shift and stage == 0)
	stage = 1;
if (stage == 1)
	y += 0.1 * dtime;
