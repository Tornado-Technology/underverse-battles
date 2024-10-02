sprite_index = noone;

highscore = data_get("Data.Minigames.GetBanana.Highscore");
bscore = 0;

bspeed = 2.5;
btime = 0;
btime_max = 180;

cspeed = 4;
ctime = 0;
ctime_max = 25;

translate_score = translate_get("MiniGame.Scores");
translate_back = translate_get("MiniGame.BackToMenu");
trnaslate_highscore = translate_get("MiniGame.Highscore");

text_width_back = string_real_width(translate_back, global._font_main_determination);

button_exit = new UITextButton(0, translate_back)
	.set_on_press(function() {
		global.__ui_controls_instance.enable = false;
		room_goto(room_menu);
	});

if (is_mobile) {
	global.__ui_controls_instance.enable = true;
} else {
	button_exit = undefined;
}

add_score = function(value) {
	bscore += value;
	
	if (bscore > highscore) {
		set_highscore(bscore);
	}
};

set_highscore = function(value) {
	highscore = value;
	data_set("Data.Minigames.GetBanana.Highscore", value);
};
