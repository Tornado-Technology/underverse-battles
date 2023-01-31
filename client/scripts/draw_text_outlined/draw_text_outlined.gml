function draw_text_outlined(_x, _y, str_color, outline_color, str){
		//Outline
		draw_set_color(outline_color);
		draw_text(_x+1, _y+1, str);  
		draw_text(_x-1, _y-1, str);  
		draw_text(_x,   _y+1, str);  
		draw_text(_x+1,   _y, str);  
		draw_text(_x,   _y-1, str);  
		draw_text(_x-1,   _y, str);  
		draw_text(_x-1, _y+1, str);  
		draw_text(_x+1, _y-1, str);
		//Text
	draw_set_color(str_color);
	draw_text(_x, _y, str);
}