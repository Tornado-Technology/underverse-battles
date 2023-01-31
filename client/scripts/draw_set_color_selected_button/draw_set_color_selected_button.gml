function draw_set_color_selected_button(button_num, num, color1, color2){
	if (button_num == num)
		draw_set_color(color1);
	else
		draw_set_color(color2);
}