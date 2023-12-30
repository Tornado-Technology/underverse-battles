// Arguments: damage_zone
		
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var random_position = Vector2(irandom_range(border_instance.x - border_instance.left + 2, border_instance.x + border_instance.right - 2), border_instance.y);
	instance_create_depth(random_position.x, random_position.y, fight_depth.bullet_outside, obj_damage_zone_warning_xchara);
}

var period = 28 - _power * 2;
var amount = 12 + _power * 2;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], amount - 1);
time_source_update_destroy = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});