_angle_hearts = approach(_angle_hearts, 360, 3);
_angle_hearts = _angle_hearts == 360 ? 0 : _angle_hearts;

for (var i = 0; i < 4; i++) {
	var heart = hearts[i];
	if (!instance_exists(heart)) continue;
	heart.x = x + dcos(_angle_hearts + 90 * i) * rad;
	heart.y = y + dsin(_angle_hearts + 90 * i) * rad;
}

motion_set(_angle, _speed);