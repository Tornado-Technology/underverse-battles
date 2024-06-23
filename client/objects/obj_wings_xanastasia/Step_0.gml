index = approach(index, 2, 0.1 * dtime);
image_index = index;

if (index == 2 && !disappearance) {
	spaw_wave();
	disappearance = true;
}
else if (disappearance) {
	image_alpha -= 0.1;	
};

image_angle = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y) - 290;

if (!image_alpha) {
	instance_destroy();	
};