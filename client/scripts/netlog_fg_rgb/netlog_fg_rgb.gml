/// @description  netlog_fg_rgb(red, green, blue)
/// @param red
/// @param  green
/// @param  blue
function netlog_fg_rgb(argument0, argument1, argument2) {
	return chr(27) + "[38;2;"
	    + string_format(argument0, 0, 0) + ";"
	    + string_format(argument1, 0, 0) + ";"
	    + string_format(argument2, 0, 0) + "m";
}
