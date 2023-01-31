time++;

if (time <= 20) {
	image_xscale += 0.05;
	image_yscale += 0.05;
}
else if (time == 21) {
	if (!instance_exists(obj_battle_soul))
		exit;
	_knife[0] = instance_create_depth(x, y, 0, obj_knife_directed_xchara);
	_knife[0]._target_angle = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y);
	_knife[1] = instance_create_depth(x, y, 0, obj_knife_directed_xchara);
	_knife[1]._target_angle = _knife[0]._target_angle + 15;
	_knife[2] = instance_create_depth(x, y, 0, obj_knife_directed_xchara);
	_knife[2]._target_angle = _knife[0]._target_angle - 15;
}
else if (time > 21) {
	image_xscale -= 0.05;
	image_yscale -= 0.05;
	if (image_xscale <= 0 or image_yscale <= 0)
		instance_destroy();
}