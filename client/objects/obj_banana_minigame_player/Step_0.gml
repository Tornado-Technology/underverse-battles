var input_vertical = (input_check_held(input.down)) - (input_check_held(input.up));

y += input_vertical * _speed_vertical;

var obj = obj_banana_minigame_banana;
if(place_meeting(x, y, obj)) {
	var _inst = instance_place(x, y, obj);
	
	if (_inst != noone) {
		with (_inst) {
			instance_destroy();
		}
		
		obj_banana_minigame_manager.bscore += 1;
		audio_play_sound_plugging(snd_get_banana);
	}
}

var obj = obj_banana_minigame_car;
if(place_meeting(x, y, obj)) {
	var _inst = instance_place(x, y, obj);
	
	if (_inst != noone) {
		if (!_inst.is_crush) {
			_inst.is_crush = true;
			obj_banana_minigame_manager.bscore -= 1;
		}
	}
}

move_wrap(true, false, sprite_width / 2);