// Arguments bow, arrow


rot = fight_random_integer(0, 1);
_side = fight_random_choose(0, 90, 180, 270);
step = 20;

callback = function () {
		var side_random = fight_random_choose(dir.up, dir.down, dir.left, dir.right);
		var offset = 20;
	var  soul_position = new Vector2(border_instance.x - border_instance.left + offset, border_instance.y - border_instance.up + offset);
		if (side_random == dir.down) {
			soul_position = new Vector2(border_instance.x + border_instance.right - offset, border_instance.y - border_instance.up + offset);
		};
		if (side_random == dir.left) {
			soul_position = new Vector2(border_instance.x - border_instance.left + offset, border_instance.y + border_instance.down - offset);
		};
		if (side_random == dir.right) {
			soul_position = new Vector2(border_instance.x + border_instance.right - offset, border_instance.y + border_instance.down - offset);
		};
	
	
	soul_instance = create_soul(soul_position.x, soul_position.y, battle_soul_type.red);
	
	var radius =  100;
	var angle = 360 / 4;
	var i  = angle;
	while(i <= 360) {
		var blades = instance_create_depth(border_instance.x + dcos(i) * radius, border_instance.y + -dsin(i) * radius, fight_depth.bullet_outside_hight, obj_blade_radius_dream, {	
			angle: i,
			center_x: border_instance.x,
			center_y: border_instance.y
		});
		
		blades.speed_const = 1.5 + _power * 0.1;
		i += angle;	
	}
	
	
	
	update();
	time_source_start(time_source_update);	
	time_source_start(time_source_update_destroy);
};

	
update = function () {
	var offset_x = fight_random_integer(70, 90);
	var offset_y = 20;
	
	var px1 = border_instance.x - border_instance.left - offset_x;
	var px2 = border_instance.x + border_instance.right + offset_x;
	var py1 = border_instance.y - border_instance.up - offset_y;
	var py2 = border_instance.y + border_instance.down + offset_y + 10;
	var random_x = [fight_random_choose(px1, px2), fight_random_choose(px2, px1)];
	var random_y = fight_random_choose(py1, py2);
	
	var coord_new = rand_side_from(random_x[0], random_y, random_x[1], random_y);
		
 create_bow(bow, arrows, 3 + _power * 0.3, fight_random_integer(1, 100) <= (15 + _power * 10), coord_new[0], coord_new[1],  point_direction(coord_new[0] , coord_new[1], soul_instance.x, soul_instance.y),   1 / 6,  0.7 - _power * 0.1,  0.5 - _power * 0.1);


};


var period = 45 - (_power * 2);
var repeats = 10 + _power;


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
update();	
}, [], repeats - 1);



time_source_update_destroy = time_source_create(time_source_game,  (period * repeats) / 60, time_source_units_seconds, function () {
	instance_destroy();	
});	
	