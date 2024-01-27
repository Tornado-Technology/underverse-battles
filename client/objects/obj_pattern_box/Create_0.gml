// Arguments

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var random_position = new Vector2(0, -10);
	if (irandom_range(0, 1) == 0) {
		// Right
		var offset_x = 25;
		var start_x = border_instance.x - border_instance.right - 10;
		random_position.x = start_x - irandom_range(offset_x, offset_x * 2);
	} else {
		// Left
		var offset_x = 25;
		var start_x = border_instance.x + border_instance.left + 10;
		random_position.x = start_x + irandom_range(offset_x, offset_x * 2);
	}
	
	var spr_box = choose(spr_jevil_clubs_box, spr_jevil_diamonds_box, spr_jevil_hearts_box, spr_jevil_spades_box);
	var box = instance_create_depth(random_position.x, random_position.y, 0, obj_jevil_box, {
		sprite_index : spr_box,
		_power : _power,
		soul : soul_instance
		});
	box.target_position.x = box.x;
	box.target_position.y = border_instance.y + border_instance.down + irandom_range(-125, 50);
	box._speed.x = 1;
	box._speed.y = random_range(2, 2.7);
};

var period = 33 - 2 * _power;
var repeats = 10 + _power * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});