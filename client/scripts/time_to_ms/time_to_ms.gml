/// @desc Return string as m:s format
/// @param {Real} time - Number of seconds
/// @return {String}
function time_to_ms(time) {
	var seconds = floor(time / 60) % 60;
	var minutes = floor(time / 3600);
	
	var seconds_string = (seconds > 9 ? "" : "0") + string(seconds);
	var minutes_string = (minutes > 9 ? "" : "0") + string(minutes);
	
	return minutes_string + ":" + seconds_string;
}
