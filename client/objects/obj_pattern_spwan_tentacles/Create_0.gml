// Arguments: bomb,  spike

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	speed_const = 1 + _power * 0.1;
	var _dir = 90;
	var multiplication = 1;
	var offset_x = 35;
	var offset_y = 30;
	var scale_const = 0.7;
	repeat (2) {
		var bomb_instnace = instance_create_depth(border_instance.x - border_instance.left + offset_x * multiplication, border_instance.y - border_instance.up + offset_y *  multiplication, fight_depth.bullet, bomb, {
			speed_const: speed_const,
			direction: _dir * multiplication,
			scale_const: scale_const
		});
		
		multiplication += 2;
	}
	
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};
update = function () {
	var offset = irandom_range(-20, 20);
	if (irandom_range(0, 1)) {
		var spike_instance = instance_create_depth(border_instance.x - offset, border_instance.y - border_instance.up - 20, fight_depth.bullet_outside_hight, spike, {
			direction: 270, 
			image_angle: 270
		});
	}
	else {
		var spike_instance = instance_create_depth(border_instance.x - offset, border_instance.y + border_instance.down + 20, fight_depth.bullet_outside_hight, spike, {
			direction: 90, 
			image_angle: 90
		});
	};
	spike_instance.speed_const = 3 + _power * 0.2;
}

 
var period = 33 - (2 + _power) * 2;
var repeats = 5 + ( 5 + _power) * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1.5, time_source_units_seconds, function () {
	instance_destroy();
});