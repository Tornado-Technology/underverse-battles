/// @param {String} message
function send_message_in_discord(message) {
	var map = ds_map_create();
	ds_map_add(map, "Content-Type", "application/json");

	var data = {
		"embeds": [
			{
				"color": 0xff0000,
				"title": "Crash report",
				"description": message,
			},
		],
	};

	http_request(logging_discord_url, "POST", map, json_stringify(data));
}
