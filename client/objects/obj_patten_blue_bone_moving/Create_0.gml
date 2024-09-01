offset = 90;
border_left = border_instance.x - border_instance.left - offset - 10;
border_right = border_instance.x + border_instance.right + offset;
bone_repeats_from_one_side = fight_random_integer(2, 4);
bone_x = fight_random_choose(border_right, border_left);
bone_y = border_instance.y + border_instance.down + 10;

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 5, battle_soul_type.blue);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_destroy_update);
}

update = function() {
	var speed_bone = 2 + _power * 0.1;
	//var can_spwan_left = soul_instance.x > border_instance.x - border_instance.left + 70;
	//var can_spwan_right = soul_instance.x < border_instance.x + border_instance.right - 70;
	var size_bone = fight_random_float(2, 2.5) - _power * 0.1;
	var size_blue_bone = 6 - size_bone;
	
	//if (!can_spwan_left) {
	//	bone_x = border_right;
	//}
	
	//if (!can_spwan_right) {			
	//	bone_x = border_left;
	//}
	
	var angle = point_direction(bone_x, bone_y, border_instance.x, bone_y);
	var distance_between_bones = bone_x == border_instance.x + border_instance.right + offset ? 70 : -70;
	
	create_bone(bone_x, bone_y, bone, speed_bone, size_bone, angle, 0);
	if (bone_repeats_from_one_side > 1) {
		create_bone(bone_x  + distance_between_bones, bone_y, bone_blue, speed_bone, size_blue_bone, angle, 0);
	}
	
	bone_repeats_from_one_side--;
	if (bone_repeats_from_one_side == 0) {
		bone_repeats_from_one_side = fight_random_integer(2, 4);
		bone_x = bone_x == border_right ? border_left : border_right;
	}
}

var period = 80 - _power * 4;
var repeats = 5 + _power * 2;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_destroy_update = time_source_create(time_source_game, period * (repeats + 1) / 60, time_source_units_seconds, function () {
	instance_destroy();	
});
