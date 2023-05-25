/// @param {String} char
/// @return {Real}
function char_get_height(char, font = draw_get_font()) {
	if (font == -1) { 
		return default_font_char_height;
	}
	
	var info = font_get_info(font);	
	return info.glyphs[$ char].h;
}
