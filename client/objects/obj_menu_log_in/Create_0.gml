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

on_login = on_network_login.connect(function(args) {
	switch(args[0]) {
		case "success":
			autolog_save(inputbox_login.text, inputbox_password.text);
			show_loading = false;
			buttons_show = true;
			menu_successful_login(obj_menu);
			menu_switch_pause(false);
			instance_destroy();
			break;
		
		case "fail":
			show_loading = false;
			buttons_show = true;
			menu_switch_pause(false);
			break;
	}
});

if (network_account != undefined) {
	on_login(["success"]);
}
