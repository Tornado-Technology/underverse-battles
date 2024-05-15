event_inherited();

shake_position.x = 0;
shake_position.y = 0;
if (is_shaking) {
	shake_position.x = irandom_range(-shake_power, shake_power);
	shake_position.y = irandom_range(-shake_power, shake_power);
}
x += shake_position.x;
y += shake_position.y;