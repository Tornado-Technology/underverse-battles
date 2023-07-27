/// @return {Real} x
/// @return {Real} y
/// @return {Constant.Color} color
/// @return {Constant.Color} outline_color
/// @return {String} str
function draw_text_outlined(x, y, str_color, outline_color, str) {
	// Outline
	draw_set_color(outline_color);
	
	draw_text(x + 1, y + 1, str);  
	draw_text(x - 1, y - 1, str);  
	draw_text(x + 0, y + 1, str);  
	draw_text(x + 1, y + 0, str);  
	draw_text(x + 0, y - 1, str);  
	draw_text(x - 1, y + 0, str);  
	draw_text(x - 1, y + 1, str);  
	draw_text(x + 1, y - 1, str);
	
	// Text
	draw_set_color(str_color);
	draw_text(x, y, str);
}