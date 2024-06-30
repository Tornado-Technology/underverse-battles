
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 5, battle_soul_type.blue);
	spwan_bone = true;
	update_two_bone();

	time_source_start(time_source_update_two_bone);
	time_source_start(time_source_destroy_update);
}



update_two_bone = function () {
	if (!spwan_bone) exit;
	var randon_bone = [bone, obj_bone_blue_papyrus];
	var random_x ;
	var offset = 90;
	var border_left = border_instance.x - border_instance.left - offset - 10;
	var border_right = border_instance.x + border_instance.right + offset;
	
	var can_spwan_left  = soul_instance.x > border_instance.x - border_instance.left + 70;
	var can_spwan_right = soul_instance.x < border_instance.x + border_instance.right - 70;
	
	random_x =  choose(border_right, border_left);
	
	if(!can_spwan_left) {
		random_x = 	border_right;
	};
	
	if(!can_spwan_right) {			
		random_x = border_left;
	};
	
	var random_y =	border_instance.y + border_instance.down + 10;
	var angle = point_direction(random_x, random_y, border_instance.x, random_y);
	
	var distance_between_bones = random_x == border_instance.x + border_instance.right + offset ? 70 : -70;
	
	var size_bone = random_range(2, 3);
	var size_blue_bone = random_range(3, 4);
	
	create_bone(random_x, random_y, randon_bone[0], 2 + _power * 0.1, size_bone, angle, 0);
	create_bone(random_x  + distance_between_bones, random_y, randon_bone[1], 2 + _power * 0.1, size_blue_bone, angle, 0);

	
	spwan_bone = false;
	time_source_start(time_source_cooldown);	
}

var period = 35 - _power;
var repeats = 10 + _power * 2;
var cooldown = period + 5;

time_source_update_two_bone = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_two_bone();
}, [], -1);

time_source_cooldown = time_source_create(time_source_game, cooldown / 60, time_source_units_seconds, function () {
	spwan_bone = true;
});


time_source_destroy_update = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
});
