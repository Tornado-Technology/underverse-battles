/// @param {String} char
/// @return {Real}
function char_get_width(char, font = draw_get_font(), match_offset = false) {
	if (font == -1) { 
		return 12;
	}
	
	var info = font_get_info(font);
	var glyph = info.glyphs[$ char];
	
	if (glyph == undefined) {
		show_debug_message(char)
	}
	
	return glyph.w + match_offset ? glyph.shift : 0;
}
