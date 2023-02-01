function RedSoulStrategy() : SoulStrategy() constructor {
	movement_speed = 1.8;
	
	velocity_x = 0;
	velocity_y = 0;

	outside_force_x = 0;
	outside_force_y = 0;

	border_delta_x = 0;
	border_delta_y = 0;

	border_force_x = 0;
	border_force_y = 0;

	is_stunned = false;
	
	/// @param {Id.instance} soul_instance
	static on_create = function(soul_instance) {
		soul_instance.sprite_index = spr_battle_soul_red;
	}
	
	/// @param {Id.instance} soul_instance
	static update = function(soul_instance) {
		var x = soul_instance.x;
		var y = soul_instance.y;
		var moveable = soul_instance.moveable;
		var ability = soul_instance.ability;
		
		if (!moveable && !is_stunned) {
			stun();
			return;
		}
		
		if (!moveable) return;

		var current_movement_speed = (ability ? movement_speed / 2 : movement_speed);

		var input_x = 0;
		var input_y = 0;
		if (is_desktop) {
			input_x = input_check_held(input.right) - input_check_held(input.left);
			input_y = input_check_held(input.down) - input_check_held(input.up);
		}
		if (is_mobile) {
			input_x = input_joystick.input_vector.x;
			input_y = input_joystick.input_vector.y;
		}
		
		velocity_x = current_movement_speed * input_x * delta_time;
		velocity_y = current_movement_speed * input_y * delta_time;
		
		var pusher_instance = handle_pusher(x, y);

		if (place_meeting(x + velocity_x + outside_force_x, y, obj_solid)) {
			while(!place_meeting(x + sign(velocity_x + outside_force_x), y, obj_solid)) 
				x += sign(velocity_x + outside_force_x);
	
			velocity_x = 0;
	
			if (outside_force_x != 0)
				fight_soul_damage(pusher_instance.damage, pusher_instance.destructible, pusher_instance);
	
			outside_force_x = 0;
			border_force_x = border_delta_x;
		} else {
			border_force_x = 0;
		}

		if (place_meeting(x, y + velocity_y + outside_force_y, obj_solid)) {
			while(!place_meeting(x, y + sign(velocity_y+outside_force_y), obj_solid)) 
				y += sign(velocity_y + outside_force_y);
	
			velocity_y = 0;
	
			if (outside_force_y != 0)
				fight_soul_damage(pusher_instance.damage, pusher_instance.destructible, pusher_instance);
		
			outside_force_y = 0;
			border_force_y = border_delta_y;
		} else {
			border_force_y = 0;
		}

		x += velocity_x + outside_force_x + border_force_x;
		y += velocity_y + outside_force_y + border_force_y;
	}
	
	static stun = function() {
		is_stunned = true;
		effect_fade(0.1, 1, c_blue, c_blue, true, 0);
		battle_border_set_color(false, false, c_blue);
	}
	
	static handle_pusher = function(x, y) {
		if (place_meeting(x, y, obj_battle_pusher)) {
	
			var pusher_instance = instance_place(x, y, obj_battle_pusher);
			var blast_angle = pusher_instance._angle;
	
			var cos_blast_angle = cos(degtorad(blast_angle));
			var sin_blast_angle = sin(degtorad(blast_angle));

			outside_force_x = 8 * cos_blast_angle;
			outside_force_y = -8 * sin_blast_angle;
	
			velocity_x = 0;
			velocity_y = 0;
			
			return pusher_instance;
		}
		outside_force_x = 0;
		outside_force_y = 0;
		return noone;
	}
	
	static handle_collision_x = function(soul_instance, pusher_instance) {
		var x = soul_instance.x;
		var y = soul_instance.y;
		
		if (place_meeting(x + velocity_x + outside_force_x, y, obj_solid)) {
			while(!place_meeting(x + sign(velocity_x + outside_force_x), y, obj_solid)) {
				x += sign(velocity_x + outside_force_x);
			}
	
			velocity_x = 0;
	
			if (outside_force_x != 0) {
				fight_soul_damage(pusher_instance.damage, pusher_instance.destructible, pusher_instance);
			}
	
			outside_force_x = 0;
			border_force_x = border_delta_x;
		} else {
			border_force_x = 0;
		}
	}
	
	/// @param {Id.instance} soul_instance
	static draw = function(soul_instance) {
	}
	
	/// @param {Id.instance} soul_instance
	static on_destroy = function(soul_instance) {
	}
}