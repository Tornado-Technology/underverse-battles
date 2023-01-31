if (place_meeting(x, y, char_ink_sans_gb_blast)) {
	var blast_angle = other._angle;
	var cos_blast_angle = cos(degtorad(blast_angle));
	var sin_blast_angle = sin(degtorad(blast_angle));

	outside_force_x = 5 * cos_blast_angle;
	outside_force_y = 5 * sin_blast_angle;
}
else {
	outside_force_x = 0;
	outside_force_y = 0;
}