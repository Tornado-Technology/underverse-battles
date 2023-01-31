blackon = false;

for (i = 0; i < trimax; i++) {
    // Floor
	event_user(0);
    draw_triangle(xcen, ycen, xcen + newx1, ycen + newy1, xcen + newx2, ycen + newy2, 0);
}

for (i = 0; i < trimax; i++) {
	// Floor Column
    event_user(0);
    if ((newy1 > 0 || newy2 > 0) && (newx2 > (newx1 - 48))) {
		draw_triangle(xcen, (ycen - 80), (xcen + (newx1 / 6)), (ycen + (newy1 / 6)), (xcen + (newx2 / 6)), (ycen + (newy2 / 6)), 0)
	}
}

for (i = trimax; i > -1; i--) {
	// Ceiling Column
    event_user(0);
    if (newy1 > 0 || newy2 > 0) {
		draw_triangle(xcen, (ycen - 80), (xcen + (newx1 / 4)), ((ycen + newy1) - 380), (xcen + (newx2 / 4)), ((ycen + newy2) - 380), 0)
	}
}

for (i = 0; i < trimax; i++) {
	// Ceiling
	event_user(0);
    draw_triangle(xcen, (ycen - 320), (xcen + newx1), ((ycen + newy1) - 320), (xcen + newx2), ((ycen + newy2) - 320), 0);
}


if (rotating) { 
	rotcounter += 1;

	if (rotcounter >= rotfps) {
		if (rotspeed < 1) { 
			rotspeed += 0.1;
		}
		
		rot += ((2.5 * rotfps) * rotspeed)
		rotcounter = 0
	}
}