///@param {Asset.GMObject} gasterblaster
///@param {Asset.GMInstance} target
///@param {Number} fly_time
///@param {Number} charge_time
///@param {Number} flyout_time
///@param {Number} destroy_time
///@param {Number} max_spread
function create_aiming_gasterblaster_with_pattern(gasterblaster, target, fly_time = 1/6, charge_time = 1, flyout_time = 15/60, destroy_time = 1/6, max_spread = 0) {	
	var gasterblaster_size = object_get_sprite_max_size(gasterblaster);
	var position = fight_random_outside_position(gasterblaster_size, gasterblaster_size);
	var target_distance = 50;
	var gasterblaster_direction = point_direction(position.x, position.y, soul_instance.x, soul_instance.y);
	var final_position = new Vector2(
		soul_instance.x - target_distance * dcos(gasterblaster_direction),
		soul_instance.y + target_distance * dsin(gasterblaster_direction)
	);
	
	if (instance_exists(obj_battle_border)) {
		target_distance = 20;
		do {
			target_distance += 10;
			final_position = new Vector2(
				soul_instance.x - target_distance * dcos(gasterblaster_direction),
				soul_instance.y + target_distance * dsin(gasterblaster_direction)
			);
		}
		until (!point_in_rectangle(final_position.x, final_position.y,
			obj_battle_border.x - obj_battle_border.left, obj_battle_border.y - obj_battle_border.up,
			obj_battle_border.x + obj_battle_border.right, obj_battle_border.y + obj_battle_border.down))
	}
	
	var var_struct = {};
	var_struct.target_x = target.x;
	var_struct.target_y = target.y;
	var_struct.final_position_x = final_position.x;
	var_struct.final_position_y = final_position.y;
	var_struct.fly_time = fly_time;
	var_struct.charge_time = charge_time;
	var_struct.flyout_time = flyout_time;
	var_struct.destroy_time = destroy_time;
	var_struct.max_spread = max_spread;
	
	return instance_create_depth(position.x, position.y, fight_depth.bullet_outside_hight, gasterblaster, var_struct);
}