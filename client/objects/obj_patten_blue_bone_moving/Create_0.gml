cooldown = 10;
callback = function () {
	soul_instance = create_soul(border_instance.x + 15, border_instance.y + border_instance.down - 5, battle_soul_type.blue);
	
	update_two_bone();
	
	time_source_start(time_source_update_two_bone);
	time_source_start(time_source_blue_bone);
	time_source_start(time_source_destroy_update);
}

update_blue_bone = function () {	
		create_bone(border_instance.x + border_instance.right, border_instance.y + border_instance.down, obj_bone_blue_papyrus, 2, 5,  180, 0);
}


update_two_bone = function () {
	var offset = 20;
	var random_x = 	choose(border_instance.x - border_instance.left - offset, border_instance.x + border_instance.right + offset);
	var random_y =	border_instance.y + border_instance.down + offset;
	
	var angle = random_x  == border_instance.x - border_instance.left - offset ? 0 : 180;

	var i = 0;
	repeat(2) {
		var size_bone = irandom_range(3, 4);
			create_bone(random_x + 10 * i, random_y, bone, 2 + _power * 0.1, size_bone, angle, 0);
		i++;
	}
}


var period = 35 - _power;
var repeats = 5 + _power;


time_source_update_two_bone = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_two_bone();

}, [], -1);

time_source_cooldown = time_source_create(time_source_game, cooldown / 60, time_source_units_seconds, function () {
	spwan_bone = true;
});

time_source_blue_bone = time_source_create(time_source_game, (period + 100) / 60, time_source_units_seconds, function () {
	update_blue_bone();	
}, [], -1);

time_source_destroy_update = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
});
