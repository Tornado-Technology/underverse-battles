sprite_index = noone;

bscore = 0;

bspeed = 2.5;
btime = 0;
btime_max = 200;

cspeed = 4;
ctime = 0;
ctime_max = 25;

translate_score = translate_get("MiniGame.Scores");
translate_back = translate_get("MiniGame.BackToMenu");

draw_set_font(font_determination);
text_width_back = string_real_width(translate_back);

button_exit = UITextButton(translate_back, function() {
	global.__ui_controls_instance.enable = false;
	room_goto(room_menu);
})

if (is_mobile || mobile_mode) {
	global.__ui_controls_instance.enable = true;
} else {
	delete button_exit;
}
