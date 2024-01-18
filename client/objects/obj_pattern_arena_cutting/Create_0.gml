// Arguments: knife_swing

callback = function () {
	instance_create(obj_pattern_flying_bones, {
		border_instance: border_instance,
		_power: _power,
		bone: obj_bone_topref_cross_xevent,
		sides: [dir.left, dir.right],
		is_aiming: false,
		custom_repeats: 16 + _power * 5,
		final_function: destroy
	}).callback();
	
	time_source_start(time_source_update);
}

update = function() {
	var py1 = border_instance.y - border_instance.up;
	var py2 = border_instance.y + border_instance.down;
	var rand_px1 = irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	var rand_px2 = irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	if (rand_px1 < border_instance.x - border_instance.left + 20 && rand_px2 < border_instance.x - border_instance.left + 20)
		rand_px2 += 20;
	if (rand_px1 < border_instance.x + border_instance.right - 20 && rand_px2 > border_instance.x + border_instance.right - 20)
		rand_px2 -= 20;
	var rand_dir = point_direction(rand_px1, py1, rand_px2, py2);
	var rand_dist = point_distance(rand_px1, py1, rand_px2, py2);
	
	create_knife_swing(rand_px1, py1, knife_swing, rand_dir, rand_dist, fight_network_mode);
}
	
var repeats = 4 + (_power div 2);
time_source_update = time_source_create(time_source_game, 1, time_source_units_seconds, function () {
	update();
}, [], repeats);
	
destroy = function() {
	instance_destroy(id);
}