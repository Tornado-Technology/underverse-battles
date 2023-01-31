/// @description  netlog_with_level(level, level_red, level_green, level_blue, message)
/// @param level
/// @param level_red
/// @param level_green
/// @param level_blue
/// @param message
function netlog_with_level(argument0, argument1, argument2, argument3, argument4) {
	return netlog(netlog_bg_rgb(0, 0, 0)
	    + netlog_fg_rgb(255, 255, 255) + "["
	    + netlog_fg_rgb(argument1, argument2, argument3) + argument0
	    + netlog_fg_rgb(255, 255, 255) + "] "
	    + argument4
	);
}
