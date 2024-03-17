// Arguments:  thread_tentacles, spike


callback = function () {
	soul_instance = create_soul(border_instance.x + 30, border_instance.y, battle_soul_type.red);
	
	var border = {
		up : border_instance.y - border_instance.up,
		down : border_instance.y + border_instance.down,
		left : border_instance.x - border_instance.left,
		right : border_instance.x + border_instance.right		
	}
	
	slime_count = 4;
	var i = 0;
	repeat (slime_count) {
	var fram = [border_instance._inst_frame_up, border_instance._inst_frame_down, border_instance._inst_frame_left, border_instance._inst_frame_right];
		slime_instance[i] = instance_create_depth(border.left + 20 * i, fram[0].y, fight_depth.bullet_outside, obj_tentacles_tremble_nightmare, {
			image_xscale: 2	
		});
		slime_instance[i].sprite_index = spr_big_slime_nightmare;	
		i++;
	}

	
		
	border_instance.spining = true;	
	border_instance.speed_spining = 1 + _power * 0.1;
	border_instance.depth = 0;
	time_source_start(time_source_update);
	time_source_start(time_source_update_start);
	time_source_start(time_source_update_destroy);
}

update_start = function() {
	//var i = 0;
	//var fram = [border_instance._inst_frame_up, border_instance._inst_frame_down, border_instance._inst_frame_left, border_instance._inst_frame_right]	

	var i = 0;
	var fram = [border_instance._inst_frame_right, border_instance._inst_frame_down, border_instance._inst_frame_right,  border_instance._inst_frame_left];
	var angle = [fram[0].image_angle + 180,fram[i].image_angle, fram[i].image_angle + 270,  fram[i].image_angle + 270];
	repeat(4) {
		slime_instance[i].x = fram[i].x;
		slime_instance[i].y = fram[i].y; 
		
		slime_instance[i].image_angle = angle[i];
		i++;
	}	


}


update = function () { 
	var x0 = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	var	bullets_instance = instance_create_depth(x0, border_instance.y - border_instance.up - 5, fight_depth.bullet_outside, obj_bullets_nightmare);
		bullets_instance.speed_const = 3 + _power * 0.1;
		bullets_instance.image_angle = 270;
}


var period = 30 - 2 -  _power * 2;
var repeats = 15 + _power * 3;

time_source_update_start = time_source_create(time_source_game, 1/ 60, time_source_units_seconds, function () {
	update_start();
}, [], -1);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
},[], -1);


time_source_update_destroy = time_source_create(time_source_game,  period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
})