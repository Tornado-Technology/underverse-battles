event_inherited();

if (!variable_instance_exists(id, "callback")) callback = function() {}

selector = new UITextButtonSelector([dialog[1], dialog[2]], input.left, input.right) 
	.set_bind_input(input.action)
	.set_padding(5)
	.set_color(c_white, c_yellow)
	.set_align(fa_center, fa_bottom)
	.set_separate(16, 130)
	.set_focus()
	.set_on_press(function(self_button) {
		audio_play_sound_once(snd_selection);
		callback(self_button.index);
		instance_destroy();
	});