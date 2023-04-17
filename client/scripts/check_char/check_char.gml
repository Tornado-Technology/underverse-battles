/// @description Checks for the existence of a character in the given font.
/// @param {String} symbol
function char_is_valid(char, font = draw_get_font()) {
	if (font == -1) { 
		return false;
	}
	
	var info = font_get_info(font);
	var glyph = info.glyphs[$ char];
	
	return glyph != undefined;
}

