event_inherited();

if (is_mobile || mobile_mode) {
	var buttons = global.__ui_virtual_buttons_instance.buttons;
	struct_remove(buttons, "SpecialAction");
	buttons[$ "X"].instance.ui.image = spr_ui_virtual_button_X;	
}