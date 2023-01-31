/// @desc Capture async events
var ev_type = async_load[? "event_type"];
if (ev_type != "DiscordReady") exit;

global.discord_initialized = true;
	
// Timestamp
var time = date_current_datetime();
np_setpresence_timestamps(time, 0, false);
