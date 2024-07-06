callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
		
	time_source_start(time_source_update);
	time_source_start(time_source_update_scythe);
	time_source_start(time_source_update_destroy);
}

update = function () { 
	var spwan_clubs = function () {	
	var border = border_instance;
	var random_position = new Vector2(0, -10);
	var random_int = irandom_range(offset_x, offset_x * 2);
		if (irandom(1)) {
			var offset_x = 25;
			var start_x = border.x - border.right - 10;
			random_position.x = start_x - random_int;
		} else {
			var offset_x = 25;
			var start_x = border.x + border.left + 10;
			random_position.x = start_x + random_int;
		}; 
	
		var box = instance_create_depth(random_position.x, random_position.y, 0, obj_box_jevil, {
			sprite_index:  spr_jevil_clubs_box
		});
		box.speed_count = 3 + _power * 0.1;
		box.target = new Vector2(box.x, border.y + border.down + irandom_range(-125, 50));
		box.step = random_range(2, 2.7);
	}
	
	var spwan_spades = function () {
		var position_finish;
		var random_position;
		var start_x;
		var finish_x;
		var box;
		var offset = irandom_range(15, 40);
	
		var start_y = choose(border_instance.y - border_instance.up - offset, border_instance.y + border_instance.down + offset);
	
		if (fight_random_integer(0,1)) {
			start_x = fight_random_integer(border_instance.x - border_instance.left - 150,  border_instance.x - border_instance.left - 70);
			finish_x = fight_random_integer(start_x + 30, start_x + 90);
		
		} else {
			start_x = fight_random_integer(border_instance.x + border_instance.right + 150,  border_instance.x + border_instance.right + 50);
			finish_x = fight_random_integer(start_x - 120, start_x - 200);
		};

		random_position = new Vector2(start_x, start_y);	
		position_finish = new Vector2(finish_x, start_y);
	
		box = instance_create_depth(random_position.x, random_position.y, 0, obj_box_jevil, {
			sprite_index:  spr_jevil_spades_box
		});
		
		box.speed_count = 3 + _power * 0.1;
		box.target = position_finish;
		box.step = random_range(2, 2.7);
	}
	
	if(fight_random_integer(0, 1)) {
		spwan_clubs();	
	} else {
		spwan_spades();	
	};
	


};


update_scythe = function () {
		var jevil_instance
	if (fight_random_integer(0, 1)) {
		jevil_instance = instance_create_depth(border_instance.x - border_instance.left - 30, border_instance.y - border_instance.up + 20, -8888, obj_turning_scythe_jevil, {
		speed_count: 3 + _power * 0.1	
	});
			jevil_instance.position_x = border_instance.x + border_instance.right + 30;
	} else {
				jevil_instance = instance_create_depth(border_instance.x + border_instance.right +	30, border_instance.y + border_instance.down - 20, fight_depth.bullet_outside_hight, obj_turning_scythe_jevil, {
				speed_count: 3 + _power * 0.1	
		});
		jevil_instance.moving_y = -1;
		jevil_instance.position_x = border_instance.x - border_instance.left - 30;
	};
	
	jevil_instance.gradually_appearing();
	jevil_instance.step = 0.09 + _power * 0.01;
	
}

var period = 90 - (_power * 2);

time_source_update_scythe = time_source_create(time_source_game, (period + 10) / 60, time_source_units_seconds, function () {
	update_scythe();	
}, [], -1);


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
	
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (270 / 60) + _power * 2, time_source_units_seconds, function () {
	instance_destroy();
});