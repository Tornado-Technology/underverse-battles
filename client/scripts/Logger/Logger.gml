function Logger() constructor {
	file = "log.txt";
	show_time = true;
	
	#region System
	
	/// @param {String} msg
	static __log__ = function(msg) {
		var directory = game_save_id + self.file;
		var file = file_text_open_append(directory);
		file_text_write_string(file, msg + "\n");
		file_text_close(file);
	}
	
	/// @param {String} msg
	/// @param {String} prefix
	/// @param {Array<Any>} args
	/// @param {Array<Real>} netlog_color
	/// @return {String}
	static __base__ = function(msg, prefix, args, netlog_color = [255, 255, 255]) {
		var format = msg;
		
		for (var i = 0; i < array_length(args); i++) {
			format = string_replace_all(format, "{" + string(i) + "}", string(args[i]));
		}
		
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
	#endregion
	
	/// @param {string} msg
	/// @param {Any} args
	static show = function(msg) {
		var args = []; for (var i = 1; i < argument_count; i++) array_push(args, string(argument[i]));
		show_debug_message(msg);
	}
	
	/// @param {string} msg
	/// @param {Any} args
	static info = function(msg) {
		var args = []; for (var i = 1; i < argument_count; i++) array_push(args, string(argument[i]));
		__base__(msg, "Info", args, [0, 255, 0]);
	}
	
	/// @param {string} msg
	/// @param {Any} args
	static alert = function(msg) {
		// Some shit
		var args = []; for (var i = 1; i < argument_count; i++) array_push(args, string(argument[i]));
		__base__(msg, "Alert", args, [255, 211, 0]);
	}
		
	/// @param {string} msg
	/// @param {Any} args
	static warning = function(msg) {
		// Some shit
		var args = []; for (var i = 1; i < argument_count; i++) array_push(args, string(argument[i]));
		__base__(msg, "Warning", args, [255, 100, 0]);
	}
	

	/// @param {string} msg
	/// @param {Any} args
	static error = function(msg) {
		var args = []; for (var i = 1; i < argument_count; i++) array_push(args, string(argument[i]));
		__base__(msg, "Error", args, [255, 0, 0]);
	}
	
	
	/// @param {string} msg
	/// @param {Any} args
	static fatal = function(msg) {
		var args = []; for (var i = 1; i < argument_count; i++) array_push(args, string(argument[i]));
		throw (__base__(msg, "Fatal", args, [255, 0, 0]));
	}
	
	
	/// @param {string} msg
	/// @param {Any} args
	/// @desc Works only in [development_mode]
	static debug = function(msg) {
		if (!development_mode) return;

		var args = []; for (var i = 1; i < argument_count; i++) array_push(args, string(argument[i]));
		__base__(msg, "Debug", args, [150, 0, 25]);
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
