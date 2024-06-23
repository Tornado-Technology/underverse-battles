	
i = 0;
var player = fight_get_player(i);
	if(fight_get_player(i).index != character_id.jevil) {
		i++;
	};
		
	position_player = fight_get_player_position(i);
	
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		

	
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var x1 = border_instance.x + border_instance.right + irandom_range(15, 50);
	var x2 = border_instance.x - border_instance.left - irandom_range(15, 50);
	var va_y1_ = border_instance.y - border_instance.up - 10;
	var va_y2_ = border_instance.y + border_instance.down + 10;
	var random_position = rand_side_from(0,va_y1_, 0,va_y2_);
	var player = fight_get_player(i);
	
	player.teleport_attack = true;
	player.speed_count = 3 + _power * 0.1;
	var player_x = fight_set_player_position_x(i, irandom(1) ? x1 : x2);
	var player_y = fight_set_player_position_y(i, random_position[1]);
	var angle = fight_get_player(i).image_angle = point_direction(random_position[0], random_position[1], soul_instance.x, soul_instance.y);
}

time_source_update = time_source_create(time_source_game, (40 - _power * 2) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (300 + _power * 20) / 60, time_source_units_seconds, function () {
	fight_set_player_position_x(i, position_player[0]);
	fight_set_player_position_y(i, position_player[1]);
	fight_get_player(i).sprite_index = fight_get_player(i).idle_animation;	
	fight_get_player(i).image_angle = fight_get_player(i).start_angle;	
	instance_destroy();
});