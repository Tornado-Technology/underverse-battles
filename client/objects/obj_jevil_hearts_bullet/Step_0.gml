image_index = sprite_frame;
angle_hearts = approach(angle_hearts, 360, 3);
angle_hearts = angle_hearts == 360 ? 0 : angle_hearts;
var i = 0;
repeat(4) {
	var heart = hearts[i];
	if (!instance_exists(heart)) continue;
	heart.x = x + dcos(angle_hearts + 90 * i) * radius;
	heart.y = y + dsin(angle_hearts + 90 * i) * radius;
	
	i++;
	
}
motion_set(angle, speed_count * dtime);