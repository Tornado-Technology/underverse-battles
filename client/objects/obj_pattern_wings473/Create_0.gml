callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	//time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {

	var i = 360 / 4;
	var angle = 360 / 4
	var r = 190;
	repeat(4) {
		var feathers = instance_create_depth(border_instance.x + dcos(i) * r, border_instance.y + -dsin(25) * r, fight_depth.bullet_outside, obj_feathers_target_anastasia, {
			center_x: soul_instance.x,
			center_y: soul_instance.y
		})
		i+= angle;
	}
}

time_source_update = time_source_create(time_source_game, (40 + _power * 2) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (280 + _power * 30) / 60, time_source_units_seconds, function () {
	instance_destroy();
});