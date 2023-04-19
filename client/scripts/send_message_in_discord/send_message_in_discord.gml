function send_message_in_discord(msg) {
	var map = ds_map_create();
	ds_map_add(map, "Content-Type", "application/json");

	var data = {
		"embeds": [
			{
				"author": {
					name: "Fatal error"
				},
				"description": msg
			}
		]
	}
	
	http_request(discord_logger_url, "POST", map, json_stringify(data));
}