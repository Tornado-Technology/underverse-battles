ping_color = {
	good: c_lime,
	normal: c_yellow,
	bad: c_red,
	no_connection: c_gray,
};

frame_rate_color = {
	good: c_lime,
	normal: c_yellow,
	bad: c_red,
	no_value: c_gray,
};

frame_rate = frame_rate_tpye.no;
show_ping = false;

ping_text = new Text()
	.set_text("No connect")
	.set_color(ping_color.no_connection)
	.set_outline(c_black);

fps_text = new Text()
	.set_text("0fps")
	.set_color(frame_rate_color.no_value)
	.set_outline(c_black);

real_fps_text = new Text()
	.set_text("0rfps")
	.set_color(frame_rate_color.no_value)
	.set_outline(c_black);

build_text = new Text()
	.set_text(os_get_config())
	.set_color(c_gray)
	.set_outline(c_black);

data_updated_handler = on_data_updated.connect(function(key) {
	switch (key) {
		case "Settings.UI.PingStyle":
			show_ping = data_get("Settings.UI.PingStyle");
			break;
			
		case "Settings.UI.FpsStyle":
			frame_rate = data_get("Settings.UI.FpsStyle");
			break;
	}
});

data_updated_handler("Settings.UI.PingStyle");
data_updated_handler("Settings.UI.FpsStyle");

network_client.ping_updated.connect(function(ping) {
	var text = ping > 0 ? $"{ping}ms" : "No connect";
	var color = ping_color.good;
	
	if (ping > 350) {
		color = ping_color.normal;
	}
	
	if (ping > 2000) { 
		color = ping_color.bad;
	}
	
	if (ping < 1) {
		color = ping_color.no_connection;
	}
	
	ping_text
		.set_text(text)
		.set_color(color);
});

fps_update = function() {
	if (frame_rate != frame_rate_tpye.fps && frame_rate != frame_rate_tpye.fps_and_real_fps) return;
	
	var text = $"{fps}fps";
	var color = frame_rate_color.bad;
	
	if (fps > 29) {
		color = frame_rate_color.normal;
	}
	
	if (fps > 49) {
		color = frame_rate_color.good;
	}
	
	fps_text
		.set_text(text)
		.set_color(color);
}

real_fps_update = function() {
	if (frame_rate != frame_rate_tpye.real_fps && frame_rate != frame_rate_tpye.fps_and_real_fps) return;
	
	var text = $"{round(fps_real)}rfps";
	var color = frame_rate_color.bad;
	
		
	if (fps_real > 999) {
		color = frame_rate_color.normal;
	}
	
	if (fps_real > 1399) {
		color = frame_rate_color.good;
	}
	
	real_fps_text
		.set_text(text)
		.set_color(color);
}

fps_update_time_source = time_source_create(time_source_game, 8 / game_base_fps, time_source_units_seconds, fps_update, [], -1);
time_source_start(fps_update_time_source);

real_fps_update_time_source = time_source_create(time_source_game, 8 / game_base_fps, time_source_units_seconds, real_fps_update, [], -1);
time_source_start(real_fps_update_time_source);