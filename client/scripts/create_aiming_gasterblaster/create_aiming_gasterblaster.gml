///@param {Asset.GMObject} gasterblaster
///@param {Number} position_x
///@param {Number} position_y
///@param {Number} final_position_x
///@param {Number} final_position_y
///@param {Asset.GMInstance} target
///@param {Number} fly_time
///@param {Number} charge_time
///@param {Number} flyout_time
///@param {Number} destroy_time
///@param {Number} max_spread
function create_aiming_gasterblaster(gasterblaster, position_x, position_y, final_position_x, final_position_y, target, fly_time = 1/6, charge_time = 1, flyout_time = 15/60, destroy_time = 1/6, max_spread = 0) {	
	var var_struct = {};
	var_struct.target_x = target.x;
	var_struct.target_y = target.y;
	var_struct.final_position_x = final_position_x;
	var_struct.final_position_y = final_position_y;
	var_struct.fly_time = fly_time;
	var_struct.charge_time = charge_time;
	var_struct.flyout_time = flyout_time;
	var_struct.destroy_time = destroy_time;
	var_struct.max_spread = max_spread;
	
	return instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, gasterblaster, var_struct);
}