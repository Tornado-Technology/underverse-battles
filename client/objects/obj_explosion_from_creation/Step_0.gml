image_index = lerp(image_index, index_sprite, step * dtime);

if (image_index >= index_sprite) {
	var angle_offset = irandom_range(120, 480);
	var angle = angle_offset / 4;
	var i = angle;
	while(i <= angle_offset) {
		create_spike(x + dcos(i), y + -dsin(i), obj_spike_1_nightmare, 3, i);
		i+= angle;
	}
	
	instance_destroy();
}
















