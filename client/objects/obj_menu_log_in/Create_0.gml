alpha = 0.4;

buttons_show = true;
button_max = 2;
button_num = 0;

show_loading = false;

waiting_time = 300;

var sx = 123;
var fw = 16;
var ox = fw + 1;

text_waiting_for_login =  translate_get("Menu.LogIn.WaitingForLogin");
text_title =  translate_get("Menu.LogIn.Title");

menu = get_menu();
connection = menu.on_goto_page_event.connect(function() {
	instance_destroy(id);
});

on_login = on_network_login.connect(function() {
	if (is(network_account_get())) {
		autolog_save(inputbox_login.text, inputbox_password.text);
		show_loading = false;
		buttons_show = true;
		menu_switch_pause(false);
		menu_successful_login(obj_menu);
		instance_destroy();
		return;
	} 
	
	show_loading = false;
	buttons_show = true;
	menu_switch_pause(false);
});

if (is(network_account_get())) {
	on_login();
}
