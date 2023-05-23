sprite_index = noone;

alpha = 0.4;

menu = get_menu();
connection = menu.on_goto_page_event.connect(function() {
	instance_destroy(id);
});

buttons_show = true;
button_max = 2;
button_num = 0;

text_waiting_for_registration = translate_get("Menu.SignUp.WaitingForRegistration");
text_title = translate_get("Menu.SignUp.Title");
text_rules = translate_get("Menu.SignUp.Rules");

show_loading = false;

waiting_time = 300;

var sx = 115;
var fw = 16;
var ox = fw + 1;