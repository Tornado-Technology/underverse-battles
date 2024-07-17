// Arguments: slime, bullets

callback = function () {
	var border = {
		up: border_instance.y - border_instance.up,
		down: border_instance.y + border_instance.down,
		left: border_instance.x - border_instance.left,
		right: border_instance.x + border_instance.right		
	};
	var offset;
	
	x_start = border_instance.x;
	y_start = border_instance.y;
	
	get_angle_for_bullets = 0;
	
	var fram = [border_instance._inst_frame_up, border_instance._inst_frame_down, border_instance._inst_frame_left, border_instance._inst_frame_right];
	
	soul_instance = create_soul(border_instance.x + 30, border_instance.y, battle_soul_type.red);
	slime_count = 4;
	
	var i = 0;
	repeat (slime_count) {
		slime_instance[i] = instance_create_depth(border.left + 20 * i, fram[0].y, fight_depth.bullet_outside, slime, {
			speed_const: 3 + _power * 0.1,
			image_yscale: 2
		});
		
		
		with(slime_instance[i]) {
			sprite_set_offset(sprite_index, 0, 4);
		};


		i++;
	}
		
	border_instance.spining = true;	
	border_instance.speed_spining = 1 + _power * 0.1;
	
	initially_position = { 
		up: border_instance.up,
		down: border_instance.down,
		left: border_instance.left,
		right:  border_instance.right	
	};
	
	offset = 20;
	
	end_position = {
		up: initially_position.up - offset,
		down: initially_position.down - offset,
		left: initially_position.left - offset,
		right: initially_position.right - offset
	};
	
	changes = false;
	time_source_start(time_source_update);
	time_source_start(time_source_update_start);
	time_source_start(time_source_update_destroy);
}

changes_aren = function() {
	var position = ["up", "down", "left", "right"];
	var amonut = 1 + _power * 0.1;
	var i = 0;
	repeat(array_length(position)) {
		
		var current_positino = variable_instance_get(border_instance, position[i]);
		var new_position = approach(current_positino, end_position[$ position[i]], amonut);
		var old_position = approach(current_positino, initially_position[$ position[i]], amonut);
		
		if (current_positino != end_position[$ position[i]] && !changes) {
			variable_instance_set(border_instance, position[i], new_position) ;
		}
		else if(current_positino == end_position[$ position[i]] && !changes) {
			changes = true;
		};
		
		if(current_positino != initially_position[$ position[i]] && changes) {
			variable_instance_set(border_instance, position[i], old_position); 
		}
		else if (current_positino == initially_position[$ position[i]]) {
			changes = false;	
		};
			
		i++;
	}	
}




update_start = function() {

	var i = 0;
	var fram = [border_instance._inst_frame_right, border_instance._inst_frame_down, border_instance._inst_frame_right,  border_instance._inst_frame_left];
	var angle = [fram[i].image_angle + 180,fram[i].image_angle, fram[i].image_angle + 270,  fram[i].image_angle + 270];
	repeat(slime_count) {
		slime_instance[i].x = fram[i].x;
		slime_instance[i].y = fram[i].y;
	
		if (point_direction(slime_instance[i].x, slime_instance[i].y, slime_instance[i].x, border_instance.y) < slime_instance[i].y) {
				get_angle_for_bullets = i;	
		};
	
	
		slime_instance[i].image_angle = angle[i];
		slime_instance[i].image_xscale = (border_instance.up / 10);
		
		if (i == 2) {
			slime_instance[i].image_yscale = -2;
		};
		
		i++;
	}	
	
}


update = function () { 
	var x0 = fight_random_integer(slime_instance[get_angle_for_bullets].x,  slime_instance[get_angle_for_bullets].x + 20);
	var	bullets_instance = instance_create_depth(x0, slime_instance[get_angle_for_bullets].y, fight_depth.bullet_outside, bullets);
	bullets_instance.speed_const = 3 + _power * 0.1;
	bullets_instance.direction = point_direction(x0, slime_instance[get_angle_for_bullets].y, border_instance.x + irandom(50), border_instance.y); 
}


var period = 30 - (_power) * 2;
var repeats = 10 + _power * 3;

time_source_update_start = time_source_create(time_source_game, 1 / 60, time_source_units_seconds, function () {
	update_start();
	changes_aren();
}, [], -1);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
},[], -1);


time_source_update_destroy = time_source_create(time_source_game,  period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
});