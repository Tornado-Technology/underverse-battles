ping_style = {
	good: {
		color: c_lime,
		value: 1,
	},
	normal: {
		color: c_yellow,
		value: 350,
	},
	bad: {
		color: c_red,
		value: 2000,
	},
	no_connection: {
		color: c_gray,
		value: 0,
	},
};

frame_rate_style = {
	good: {
		color: c_lime,
		fps_value: 49,
		rfps_value: 1399,
	},
	normal: {
		color: c_yellow,
		fps_value: 29,
		rfps_value: 999
	},
	bad: {
		color: c_red,
		fps_value: 0,
		rfps_value: 0,
	},
	no_value: {
		color: c_gray,
		fps_value: 0,
		rfps_value: 0,
	},
};

frame_rate = frame_rate_tpye.no;
show_ping = false;
update_time = 8 / game_base_fps;

ping_text = new Text()
	.set_text("No connect")
	.set_color(ping_style.no_connection.color)
	.set_outline(c_black);

fps_text = new Text()
	.set_text("0fps")
	.set_color(frame_rate_style.no_value.color)
	.set_outline(c_black);

real_fps_text = new Text()
	.set_text("0rfps")
	.set_color(frame_rate_style.no_value.color)
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
	var text = ping[0] > ping_style.no_connection.value ? $"{ping[0]}ms" : "No connect";
	var color = ping_style.no_connection.color;

	if (ping[0] >= ping_style.good.value) {
		color = ping_style.good.color;
	}

	if (ping[0] >= ping_style.normal.value) {
		color = ping_style.normal.color;
	}
	
	if (ping[0] >= ping_style.bad.value) { 
		color = ping_color.bad.color;
	}
	
	ping_text
		.set_text(text)
		.set_color(color);
});

fps_update = function() {
	if (frame_rate != frame_rate_tpye.fps && frame_rate != frame_rate_tpye.fps_and_real_fps) return;
	
	var text = $"{fps}fps";
	var color = frame_rate_style.bad;
	
	if (fps > frame_rate_style.normal.fps_value) {
		color = frame_rate_style.normal.color;
	}
	
	if (fps > frame_rate_style.good.fps_value) {
		color = frame_rate_style.good.color;
	}
	
	fps_text
		.set_text(text)
		.set_color(color);
}

real_fps_update = function() {
	if (frame_rate != frame_rate_tpye.real_fps && frame_rate != frame_rate_tpye.fps_and_real_fps) return;
	
	var text = $"{round(fps_real)}rfps";
	var color = frame_rate_style.bad.color;
	
		
	if (fps_real > frame_rate_style.normal.rfps_value) {
		color = frame_rate_style.normal.color;
	}
	
	if (fps_real > frame_rate_style.good.rfps_value) {
		color = frame_rate_style.good.color;
	}
	
	real_fps_text
		.set_text(text)
		.set_color(color);
}

fps_update_time_source = time_source_create(time_source_game, update_time, time_source_units_seconds, fps_update, [], -1);
time_source_start(fps_update_time_source);

real_fps_update_time_source = time_source_create(time_source_game, update_time, time_source_units_seconds, real_fps_update, [], -1);
time_source_start(real_fps_update_time_source);