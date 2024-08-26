
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 5, battle_soul_type.blue);
	update();

	time_source_start(time_source_update);
	time_source_start(time_source_destroy_update);
}



update = function () {
	var speed_bone = 2 + _power * 0.1;
	var offset = 90;
	var border_left = border_instance.x - border_instance.left - offset - 10;
	var border_right = border_instance.x + border_instance.right + offset;
	var random_x = fight_random_choose(border_right, border_left);
	var random_y =	border_instance.y + border_instance.down + 10;
	var can_spwan_left  = soul_instance.x > border_instance.x - border_instance.left + 70;
	var can_spwan_right = soul_instance.x < border_instance.x + border_instance.right - 70;
	var size_bone = fight_random_float(2, 3);
	var size_blue_bone = fight_random_float(3, 4);
	
	
	if(!can_spwan_left) {
		random_x = 	border_right;
	};
	
	if(!can_spwan_right) {			
		random_x = border_left;
	};
	
	
	var angle = point_direction(random_x, random_y, border_instance.x, random_y);
	
	var distance_between_bones = random_x == border_instance.x + border_instance.right + offset ? 70 : -70;
		

	
	create_bone(random_x, random_y, bone, speed_bone, size_bone, angle, 0);
	create_bone(random_x  + distance_between_bones, random_y, bone_blue,speed_bone, size_blue_bone, angle, 0);


}

var period = 80 - _power;
var repeats = 5 + _power;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);



time_source_destroy_update = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
});
