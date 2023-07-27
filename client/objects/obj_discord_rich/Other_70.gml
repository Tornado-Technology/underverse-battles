/// @description Capture async events
var ev_type = async_load[? "event_type"];

if (ev_type != "DiscordReady") exit;

global.discord_initialized = true;

np_setpresence_timestamps(date_current_datetime(), 0, false);
