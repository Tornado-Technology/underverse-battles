	
	
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	character_instance.visible = false;
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var x1 = border_instance.x + border_instance.right + irandom_range(15, 50);
	var x2 = border_instance.x - border_instance.left - irandom_range(15, 50);
	var y1 = border_instance.y - border_instance.up - 10;
	var y2 = border_instance.y + border_instance.down + 10;
	var random_position = fight_random_integer(y1, y2);
	var x_ = irandom(1) ? x1 : x2;
	var teleport_instance = instance_create_depth(x_ , random_position, fight_depth.bullet_outside_hight, obj_teleport_jevil, {
		speed_count: 3 + _power * 0.1	
	});	

}

var period = 40 - (_power * 2);

time_source_update = time_source_create(time_source_game, period/ 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (300 + _power * 20) / 60, time_source_units_seconds, function () {
	character_instance.visible = true;
	instance_destroy();
});