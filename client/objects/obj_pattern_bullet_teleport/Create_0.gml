/// Arguments: teleport	
	
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	xscale = character_instance.image_xscale;
	character_instance.is_teleportation = true;
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var x1 = border_instance.x + border_instance.right + fight_random_integer(15, 50);
	var x2 = border_instance.x - border_instance.left - fight_random_integer(15, 50);
	var y1 = border_instance.y - border_instance.up - 10;
	var y2 = border_instance.y + border_instance.down + 10;
	var random_position = fight_random_integer(y1, y2);
	var x_ = fight_random_integer(0, 1) ? x1 : x2;
	instance_create_depth(x_ , random_position, fight_depth.bullet_outside_hight, teleport, {
		speed_count: 3 + _power * 0.1	
	});	

}

var period = 40 - (_power * 2);
var repeats = 5 + _power * 2; 

time_source_update = time_source_create(time_source_game, period/ 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	character_instance.is_teleportation = false;
	instance_destroy();
});