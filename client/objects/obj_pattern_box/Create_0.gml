/// Arguments: box

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
	
};

update = function () { 
		var left = border_instance.x - border_instance.left - irandom_range(20, 50);
		var right =  border_instance.x + border_instance.right + irandom_range(20, 50);
		var x_ = fight_random_choose(left, right);
		var y_ = fight_random_choose(border_instance.y - border_instance.up - 10, border_instance.y + border_instance.down + 10);
	
		var new_y = y_ == border_instance.y - border_instance.up - 10 ? border_instance.y + border_instance.down + irandom_range(-125, 50): border_instance.y - border_instance.up - irandom_range(-125, 50);
		
		var	box_instance = instance_create_depth(x_,  y_, fight_depth.bullet_outside, obj_box_jevil, {
			sprite_index: choose(spr_jevil_diamonds_box, spr_jevil_hearts_box, spr_jevil_clubs_box),
		});
			
		box_instance.speed_count =  3 + _power * 0.1;
		box_instance.step =  2.4 + _power * 0.2;
		box_instance.target = new Vector2(x_,  new_y );

};

var period = 35 - (2 * _power);
var repeats = 10 + _power * 3;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [],  -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1.5, time_source_units_seconds, function () {
	instance_destroy();
});