/// @param {String} char
/// @return {Real}
function char_get_width(char, font = draw_get_font(), match_offset = false) {
	if (font == -1) { 
		return default_font_char_width;
	}
	
	var info = font_get_info(font);
	var glyph = info.glyphs[$ char];
	
	try {
		return glyph.w + match_offset ? glyph.shift : 0;
	}
	catch (ex) {
		return default_font_char_width;
	}
}