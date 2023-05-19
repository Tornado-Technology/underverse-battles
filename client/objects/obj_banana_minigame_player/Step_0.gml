var input_x = int64(input_check_held(input.right)) - int64(input_check_held(input.left));
var input_y = int64(input_check_held(input.down)) - int64(input_check_held(input.up));

var velocity_x = input_x * movement_speed;
var velocity_y = input_y * movement_speed;

if (place_meeting(x + velocity_x, y, obj_wall)) {
	var direction_x = sign(velocity_x);
	while (!place_meeting(x + direction_x, y, obj_wall)) {
		x += direction_x;
	}
	
	velocity_x = 0;
}

if (place_meeting(x, y + velocity_y, obj_wall)) {
	var direction_y = sign(velocity_y);
	while (!place_meeting(x, y + velocity_y, obj_wall)) {
		x += direction_y;
	}
	
	velocity_y = 0;
}

x += velocity_x;
y += velocity_y;


var obj = obj_banana_minigame_banana;
if(place_meeting(x, y, obj)) {
	var _inst = instance_place(x, y, obj);
	
	if (_inst != noone) {
		with (_inst) {
			instance_destroy();
		}
		
		obj_banana_minigame_manager.add_score(1);
		audio_play_sound_plugging(snd_get_banana);
	}
}


move_wrap(true, false, sprite_width / 2);