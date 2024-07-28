event_inherited();

damage = get_char_damage(obj_character_xanastasia);


soul_invulnerability = 20;

gradually_alpha = false;


circle_moving = false;
angle = 0;

radius = 0;	
radius_max =  0;

stage = 0;

step = 0.01;

spinnig_speed = 0;


destroy = false;

keep_destroy = false;

target_posititon = false;
position_x = 0;
position_y = 0;

direction_swords = 0;

aim_soul = false;


on_soul_touch = function(soul) {
	if(image_alpha >= 0.8) {
		fight_soul_damage(damage, destructible, id);
	};
}


gradually_appearing = function () {
 image_alpha = 0;	
 gradually_alpha = true;	
}

phanton = false;

center = function (center_x, center_y) {
	circle_moving = true;
	self.center_x = center_x;
	self.center_y = center_y;
}

moving_target = function (position_x, position_y, direction_swords) {
	target_posititon = true;
	self.position_x = position_x;
	self.position_y = position_y;
	self.direction_swords = direction_swords;
}

target_soul = function (position, keep_destroy = false) {
	aim_soul = true;
	position_x = position.x;
	position_y = position.y;
	self.keep_destroy  = keep_destroy;
}

time_source_self_destroy = time_source_create(time_source_game, 30 / 60,  time_source_units_seconds, function () {
	destroy = true;
});

time_source_attack = time_source_create(time_source_game, 10 / 60, time_source_units_seconds, function() {
	motion_set(direction_swords, speed_count * dtime);	
})