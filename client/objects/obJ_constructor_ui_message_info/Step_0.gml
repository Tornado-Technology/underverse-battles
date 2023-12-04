if (!show_msg) exit;

if (time < time_max) {
	time += dtime;
} else if (alpha > 0) {
	alpha -= 0.05 + dtime;
} else {
	show_msg = false;
}
