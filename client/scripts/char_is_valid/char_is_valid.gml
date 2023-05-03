/// @description Checks for the existence of a character in the given font.
/// @param {String} symbol
/// @return {Bool}
function char_is_valid(char, font = draw_get_font()) {
    return font == -1 ? false : font_get_info(font).glyphs[$ char] != undefined;
}
