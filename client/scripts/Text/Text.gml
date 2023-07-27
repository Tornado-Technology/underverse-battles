function Text() constructor {
	text = "";
	color = c_white;
	alpha = 1;
	outline_color = c_white;
	
	outlined = false;
	
	static draw = function(x, y) {
		if (outlined) {
			draw_text_outlined(x, y, color, outline_color, text);
			return;
		}
		
		draw_text_color(x, y, text, color, color, color, color, alpha);
	}
	
	/// @param {String} text
	/// @return {Struct.Text}
	static set_text = function(text) {
		self.text = text;
		return self;
	}
	
	/// @param {Constant.Color} color
	/// @return {Struct.Text}
	static set_color = function(color) {
		self.color = color;
		return self;
	}
	
	/// @param {Constant.Color} color
	/// @return {Struct.Text}
	static set_outline = function(color) {
		outline_color = color;
		outlined = true;
		return self;
	}
}
