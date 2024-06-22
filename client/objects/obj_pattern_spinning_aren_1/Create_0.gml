// Arguments: slime, bullets

callback = function () {
	 create_soul(border_instance.x + 30, border_instance.y, battle_soul_type.red);
	 
	 var border = {
		up: border_instance.y - border_instance.up,
		down: border_instance.y + border_instance.down,
		left: border_instance.x - border_instance.left,
		right: border_instance.x + border_instance.right		
	};
		
	var fram = [border_instance._inst_frame_up, border_instance._inst_frame_down, border_instance._inst_frame_left, border_instance._inst_frame_right];
	
	slime_count = 4;
	slime_yscale = 1.5;
	
	var i = 0;
	repeat (slime_count) {
		slime_instance[i] = instance_create_depth(border.left + 20 * i, fram[0].y, fight_depth.bullet_outside, slime, {
			image_xscale: 6.3,
			image_yscale: slime_yscale 
		});
		
		with(slime_instance[i]) {
			sprite_set_offset(sprite_index, 0, 5);
		};
		
		slime_instance[i].disable_surface = true;
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

	end_position = {
		up: initially_position.up - 50,
		down: initially_position.down - 50,
		left: initially_position.left - 50,
		right: initially_position.right - 50
	};
	
	changes = false;

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


update_start = function () {
	var i = 0;
	var fram = [border_instance._inst_frame_right, border_instance._inst_frame_down, border_instance._inst_frame_right,  border_instance._inst_frame_left];
	var angle = [fram[i].image_angle + 180,fram[i].image_angle, fram[i].image_angle + 270,  fram[i].image_angle + 270];
	var position = ["up", "down", "left", "right"];
		
	repeat(slime_count) {
		slime_instance[i].x = fram[i].x;
		slime_instance[i].y = fram[i].y;
	
		slime_instance[i].image_angle = angle[i];
		
		slime_instance[i].image_xscale = (border_instance.up / 10);
		
		if (i == 2) {
			slime_instance[i].image_yscale = -slime_yscale;
		};
		
		i++;
	}	
	
	
	border_instance.speed_const = 3 + _power * 0.1;
	border_instance.direction = fight_random_integer(0, 359);
	
	
	if(irandom(100) <= 30) {
		time_source_start(time_source_changes_aren);	
	};
}


var period = 30 - (2 - _power) * 2;
var repeats = 10 + _power * 3;


time_source_changes_aren = time_source_create(time_source_game, 1 / 60, time_source_units_seconds, function () {
	changes_aren();
});

time_source_update_start = time_source_create(time_source_game, 1 / 60, time_source_units_seconds, function () {
	update_start();
}, [], -1);


time_source_update_destroy = time_source_create(time_source_game,  period * repeats / 60, time_source_units_seconds, function () {
	border_instance.thickness_frame = 1;
	instance_destroy();	
});