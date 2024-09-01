//Arguments: bone, bone_blue


callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 10, battle_soul_type.blue);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var bone_instance;
	var rand_side = fight_random_choose(dir.left, dir.right);
	var bone_speed = 2 + _power * 0.2;
	var speed_change = 0.09;
	
	var bones = fight_random_integer(1, 100) <= 25  ? bone_blue : bone; 
	var bone_size = 5.4	;
	var random_size = 5.5;
	
	if (rand_side == dir.right) {
		 bone_instance = create_bone(border_instance.x + border_instance.right + 4, border_instance.y + border_instance.down, bones, bone_speed, bone_size, 180, 0);
	} else {
		bone_instance = create_bone(border_instance.x - border_instance.left - 4, border_instance.y + border_instance.down, bones, bone_speed, bone_size, 0, 0);	
	};
		
	bone_instance.change_scale(speed_change, random_size);
}

var period = 55 - (_power);
var repeats = 10 + (_power);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
};

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});