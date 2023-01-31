shake_position.x = 0;
shake_position.y = 0;
if (shake_time > 0) {
	shake_time = approach(shake_time, 0, 1);
	shake_position.x = irandom_range(-shake_power, shake_power);
	shake_position.y = irandom_range(-shake_power, shake_power);
}

x += shake_position.x;
y += shake_position.y;