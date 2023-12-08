var input_x = int64(input_check_held(input.right)) - int64(input_check_held(input.left));
var input_y = int64(input_check_held(input.down)) - int64(input_check_held(input.up));

if (is_mobile) {
	var controllers_index = global.__ui_controls_instance.controllers_index;
		if (controllers_index == control_input_mode.ui_arrows) {
		var arrows_index = global.__ui_controls_instance.get_controller().controls_arrow;
		
		var arrow  =  get_arrow();
		var input_x	 =	(arrows_index.right.pressed - arrows_index.left.pressed);
		var input_y	 =	(arrows_index.down.pressed - arrows_index.up.pressed);

	};
};


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