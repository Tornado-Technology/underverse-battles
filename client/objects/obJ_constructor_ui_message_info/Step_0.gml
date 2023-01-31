if (!show_msg) exit;

if (time < time_max) {
	time++;
} else if (alpha > 0) {
	alpha -= 0.05;
} else {
	show_msg = false;
}
