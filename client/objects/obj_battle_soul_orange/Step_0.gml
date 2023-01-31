event_inherited();

if (!moveable && !is_stunned) {
	is_stunned = true;
	effect_fade(0.1, 1, c_blue, c_blue, true, 0);
	battle_border_set_color(false, false, c_blue)
}

if (!moveable)
	exit;

var SPD = 1.8;

if (ability && delay_ == 0) {
	invulnerability = true;
	delay_ = 21;
}

if (delay_ > 10) { SPD *= 2; }

/* control */
if (!is_dashing) { 
	if(input_check_held(input.up)) {
		if(!input_check_held(input.down) && !input_check_held(input.right) && !input_check_held(input.left)) {
			movement_speed_y = -SPD;
			movement_speed_x = 0;
		}
	}
	if(input_check_held(input.down)) {
		if(!input_check_held(input.up) && !input_check_held(input.right) && !input_check_held(input.left)) {
			movement_speed_y = SPD;
			movement_speed_x = 0;
		}
	}
	if(input_check_held(input.left)) {
		if(!input_check_held(input.up) && !input_check_held(input.down) && !input_check_held(input.right)) {
			movement_speed_x = -SPD;
			movement_speed_y = 0;
		}
	}
	if(input_check_held(input.right)) {
		if(!input_check_held(input.up) && !input_check_held(input.down) && !input_check_held(input.left)) {
			movement_speed_x = SPD;
			movement_speed_y = 0;
		}
	}
}

/* change direction */
if (changeable_direction) {
	switch (side) {
		case 1:
			movement_speed_x = 0;
			movement_speed_y = -SPD;
			new_image_angle = 180;
			audio_play_sound_plugging(snd_emergence);
			break;
		case 2:
			movement_speed_x = 0;
			movement_speed_y = SPD;
			new_image_angle = 0;
			audio_play_sound_plugging(snd_emergence);
			break;
		case 3:
			movement_speed_x = -SPD;
			movement_speed_y = 0;
			new_image_angle = 270;
			audio_play_sound_plugging(snd_emergence);
			break;
		case 4:
			movement_speed_x = SPD;
			movement_speed_y = 0;
			new_image_angle = 90;
			audio_play_sound_plugging(snd_emergence);
			break;
	}
	side = 0;
	/* image angle */
	if (image_angle != new_image_angle) {
		if (image_angle + 360 - new_image_angle < image_angle - new_image_angle)
			image_angle = lerp(image_angle, new_image_angle, 0.5);
		else
			image_angle = lerp(image_angle, new_image_angle - 360, 0.5);
	}
}

/* dash */
if (ability && delay_ == 0) {
	invulnerability = true;
	is_dashing = true;
	movement_speed_x *= 2;
	movement_speed_y *= 2;
	delay_ = 21;
}

/* dash end */
if (delay_ > 10) {
	var particle = instance_create_depth(x, y, depth, obj_soul_particle);
	particle.sprite_index = sprite_index;
	delay_--;
}
else if (delay_ == 10) {
	invulnerability = false;
	is_dashing = false;
	movement_speed_x /= 2;
	movement_speed_y /= 2;
	delay_--;
}
else if (delay_ > 0) {
	delay_--;
}	
	
/* pushing */
var pusher_inst = noone;
if (place_meeting(x, y, obj_battle_pusher)) {
	
	pusher_inst = instance_place(x, y, obj_battle_pusher);
	var blast_angle = pusher_inst._angle;
	
	var cos_blast_angle = cos(degtorad(blast_angle));
	var sin_blast_angle = sin(degtorad(blast_angle));

	outside_force_x = 8 * cos_blast_angle;
	outside_force_y = -8 * sin_blast_angle;
	
	movement_speed_x = 0;
	movement_speed_y = 0;
} else {
	outside_force_x = 0;
	outside_force_y = 0;
}

if (place_meeting(x + movement_speed_x + outside_force_x, y, obj_solid)) {
	while(!place_meeting(x + sign(movement_speed_x + outside_force_x), y, obj_solid)) 
		x += sign(movement_speed_x + outside_force_x);
	
	movement_speed_x = 0;
	
	if (outside_force_x != 0)
		fight_soul_damage(pusher_inst.damage, pusher_inst.destructible, pusher_inst);
		
	outside_force_x = 0;
}

if (place_meeting(x, y + movement_speed_y + outside_force_y, obj_solid)) {
	while(!place_meeting(x, y + sign(movement_speed_y+outside_force_y), obj_solid)) 
		y += sign(movement_speed_y + outside_force_y);
	
	movement_speed_y = 0;
	
	if (outside_force_y != 0)
		fight_soul_damage(pusher_inst.damage, pusher_inst.destructible, pusher_inst);
		
	outside_force_y = 0;
}

x += movement_speed_x + outside_force_x;
y += movement_speed_y + outside_force_y;