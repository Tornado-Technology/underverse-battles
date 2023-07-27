function Logger() constructor {
	file = "log.txt";
	show_time = true;
	
	/// @param {String} msg
	static __log__ = function(msg) {
		var directory = game_save_id + self.file;
		var file = file_text_open_append(directory);
		file_text_write_string(file, msg + "\n");
		file_text_close(file);
	}
	
	/// @param {String} msg
	/// @param {String} prefix
	/// @param {Array<Real>} netlog_color
	/// @return {String}
	static __base__ = function(msg, prefix, netlog_color = [255, 255, 255]) {
		var format = msg;
		var date = (show_time ? "[" + date_datetime_string(date_current_datetime()) + "]"  : "");
		var netlog_format = date + " " + format;
		format = date + "[" + prefix + "] " + format;
		
		if (netlog_enabled) {
			netlog_with_level(prefix, netlog_color[0], netlog_color[1], netlog_color[2], netlog_format);
		}
		
		if (logging_enabled) {
			show_debug_message(format);
		}
		
		if (logging_to_file) {
			__log__(format);
		}
		
		return format;
	}
	
	/// @param {string} msg
	static show = function(msg) {
		show_debug_message(msg);
	}
	
	/// @param {string} msg
	static info = function(msg) {
		__base__(msg, "Info", [0, 255, 0]);
	}
	
	/// @param {string} msg
	static alert = function(msg) {
		__base__(msg, "Alert", [255, 211, 0]);
	}
		
	/// @param {string} msg
	static warning = function(msg) {
		__base__(msg, "Warning", [255, 100, 0]);
	}
	

	/// @param {string} msg
	static error = function(msg) {
		__base__(msg, "Error", [255, 0, 0]);
	}
	
	/// @param {string} msg
	/// @desc Works only in [development_mode]
	static debug = function(msg) {
		if (!development_mode) return;
		__base__(msg, "Debug", [150, 0, 25]);
	}
	
	/// @desc Clears the log files.
	static clear = function() {
		file_delete(game_save_id + file);
		info("Cleared");
	}
	
	static open = function() {
		url_open("file:\\\\" + game_save_id + file);
	}
}

global.__logger = new Logger();

/// @return {Strcut.Logger}
#macro logger global.__logger
