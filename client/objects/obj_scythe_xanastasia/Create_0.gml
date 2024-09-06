event_inherited();

depth = fight_depth.bullet_outside_hight;

soul_invulnerability = 20;

image_alpha = 0;

damage = get_char_damage(obj_character_xanastasia);

if (!variable_instance_exists(id, "speed_count")) speed_count = 0;
if (!variable_instance_exists(id, "rotation_speed_count")) rotation_speed_count = 0;
	
angle = 0;

start_x = 0;
come_back = false;

move_come_back = false;
move_goldenratio = false;
moves_ends_arena = false;

moving_back = function() {
	come_back = true;
}

moving_arena = function (start_x, radius) {
	moves_ends_arena = true;	
	self.start_x = start_x;
	x = start_x + dcos(angle) * radius; 
	self.radius = radius;
}

audio_play_sound_plugging(snd_emergence);