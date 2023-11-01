event_inherited();

if (!moveable)
	exit;

var SPD = 1.8;
var SPD = (ability ? SPD / 2 : SPD);

/* control */
if (is_desktop && !mobile_mode) {
	if(input_check_held(input.up)) 
		movement_speed_y = -SPD; 

	if(input_check_held(input.down)) 
		movement_speed_y = SPD;

	if(input_check_held(input.right)) 
		movement_speed_x = SPD;
	if(input_check_held(input.left)) 
		movement_speed_x = -SPD;
	
	if(!input_check_held(input.up) && !input_check_held(input.down)) 
		movement_speed_y=0;
	
	if(!input_check_held(input.right) && !input_check_held(input.left)) 
		movement_speed_x=0;
}

if (is_mobile || mobile_mode) {
		var controllers_index = global.__ui_controls_instance.controllers_index
		
	if (instance_exists(obj_ui_controls) && controllers_index == 1) {
		var joystick = get_joystick();
		movement_speed_x = SPD * joystick.input_vector.x;
		movement_speed_y = SPD * joystick.input_vector.y;
	}
	
	if (instance_exists(obj_ui_controls) && controllers_index == 0) {
	var arrows_index = global.__ui_controls_instance.get_controller().controls_arrow;
		
	var arrow  =  get_arrow();
	var _arrow = input_arrows_check_button_is_held;
	var ver	 =	(_arrow(vk_down)  - _arrow(vk_up)	* SPD);
	var hor	 =	(_arrow(vk_right) - _arrow(vk_left) * SPD);
	
		arrow.input_vector.x = hor;
		arrow.input_vector.y = ver;
	
	if (arrows_index.up.pressed && arrows_index.left.pressed) {
		arrow.input_vector.sub(0, SPD);
	};
	
	if (arrows_index.right.pressed && arrows_index.up.pressed) {
		arrow.input_vector.sub(0, SPD);
	};
	
	if (arrows_index.down.pressed && arrows_index.right.pressed) {
		arrow.input_vector.add(0, SPD);
	};
	
	if (arrows_index.left.pressed && arrows_index.down.pressed) {
		arrow.input_vector.add(0, SPD);
	};

		movement_speed_x =  arrow.input_vector.x;
		movement_speed_y =  arrow.input_vector.y;
		
		 arrow.input_vector.set(0, 0);
	};
};


/* pushing */
var pusher_inst = noone;
if (place_meeting(x, y, obj_battle_pusher)) {
	
	pusher_inst = instance_place(x, y, obj_battle_pusher);
	var blast_angle = pusher_inst._angle;
	
	var cos_blast_angle = dcos(blast_angle);
	var sin_blast_angle = dsin(blast_angle);

	outside_force_x = 8 * cos_blast_angle;
	outside_force_y = -8 * sin_blast_angle;
	
	movement_speed_x = 0;
	movement_speed_y = 0;
} else {
	outside_force_x = 0;
	outside_force_y = 0;
}

var movement_delta_min = 0.01;

var full_movement_x = movement_speed_x + outside_force_x + tremble_force_x + border_force_x;
if (place_meeting(x + full_movement_x, y, obj_solid)) {
	while(!place_meeting(x + sign(full_movement_x) * movement_delta_min, y, obj_solid)) {
		x += sign(full_movement_x) * movement_delta_min;
	}
	
	movement_speed_x = 0;
	
	if (outside_force_x != 0) {
		fight_soul_damage(pusher_inst.damage, pusher_inst.destructible, pusher_inst);
	}
	
	outside_force_x = 0;
	tremble_force_x = 0;
	border_force_x = border_delta_x;
}
else {
	border_force_x = 0;
}

var full_movement_y = movement_speed_y + outside_force_y + tremble_force_y + border_force_y;
if (place_meeting(x, y + full_movement_y, obj_solid)) {
	while(!place_meeting(x, y + sign(full_movement_y) * movement_delta_min, obj_solid)) {
		y += sign(full_movement_y) * movement_delta_min;
	}
	
	movement_speed_y = 0;
	
	if (outside_force_y != 0) {
		fight_soul_damage(pusher_inst.damage, pusher_inst.destructible, pusher_inst);
	}
		
	outside_force_y = 0;
	tremble_force_y = 0;
	border_force_y = border_delta_y;
}
else {
	border_force_y = 0;
}

x += movement_speed_x + outside_force_x + tremble_force_x + border_force_x;
y += movement_speed_y + outside_force_y + tremble_force_y + border_force_y;