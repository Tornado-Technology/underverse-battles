/// @desc
function window_set_splash() {
	var splashes = translate_get("Splashes");
	var splash = array_get_random(splashes);
	window_set_caption(game_name + ": " + splash);
}