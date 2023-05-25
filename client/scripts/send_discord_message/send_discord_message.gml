/// @param {String} url
/// @param {String} title
/// @param {String} description
/// @param {Real} color
function send_discord_message(url, title, description, color = 0xff0000) {
	var map = ds_map_create();
	ds_map_add(map, "Content-Type", "application/json");

	var data = {
		"embeds": [
			{
				"color": color,
				"title": title,
				"description": sprintf("```{0}```", description),
			},
		],
	};
	
	http_request(url, "POST", map, json_stringify(data));
}
