enum vector2_dir {
	down,
	left,
	one,
	right,
	up,
	negone
}

/// @param {Real} x
/// @param {Real} y
function Vector2(x, y) constructor {
	self.x = x;
	self.y = y;
	
	static one = function() {
		x = 1;
		y = 1;
		return self;
	}
	
	static zero = function() {
		x = 0;
		y = 0;
		return self;
	}
	
	static negative = function() {
		x = -x;
		y = -y;
	    return self;
	}
		
	static set = function() {
		var vector = argument[0];
		if (argument_count > 1) {
			var _x = argument[0];
			var _y = argument[1];
			vector = new Vector2(_x, _y);
		}
		self.x = vector.x;
		self.y = vector.y;
		delete vector;
		return self;
	}
	
	static add = function() {
		var vector = argument[0];
		if (argument_count > 1) {
			var _x = argument[0];
			var _y = argument[1];
			vector = new Vector2(_x, _y);
		}
		self.x += vector.x;
		self.y += vector.y;
		delete vector;
		return self;
	}
	
	static sub = function() {
		var vector = argument[0];
		if (argument_count > 1) {
			var _x = argument[0];
			var _y = argument[1];
			vector = new Vector2(_x, _y);
		}
		self.x -= vector.x;
		self.y -= vector.y;
		delete vector;
		return self;
	}
	
	static multi = function() {
		var vector = argument[0];
		if (argument_count > 1) {
			var _x = argument[0];
			var _y = argument[1];
			vector = new Vector2(_x, _y);
		}
		self.x *= vector.x;
		self.y *= vector.y;
		delete vector;
		return self;
	}
	
	static divis = function() {
		var vector = argument[0];
		if (argument_count > 1) {
			var _x = argument[0];
			var _y = argument[1];
			vector = new Vector2(_x, _y);
		}
		self.x /= vector.x;
		self.y /= vector.y;
		delete vector;
		return self;
	}
	
	/// @param {Vector2} vector2
	static math_distance_to = function(vector2) {
		return sqrt((x - vector2.x) * (x - vector2.x) + (y - vector2.y) * (y - vector2.y));
	}
	
	/// @param {Vector2} vector2
	/// @desc Returns the dot product
	static math_dot = function(vector2) {
		return x * vector2.x + y * vector2.y;
	}
	
	/// @param {Vector2} vector2
	/// @desc Returns the cross product
	static math_cross = function(vector2) {
		return x * vector2.x - y * vector2.y;
	}
	
	/// @param {bool} return_radians
	/// @desc Returns self Vector2 angle with respect to the X axis.
	static math_angle = function(radians) {
		return (radians) ? arctan2(y, x) : darctan2(y, x);
	}

	static math_sign = function() {
		return new Vector2(sign(x), sign(y));
	}
	
	static math_signv = function() {
		var value = math_sign();
		set(value);
		delete value;
		return self;
	}
	
	/// @desc Returns a new Vector2 with all components in absolute values
	static math_abs = function() {
		return new Vector2(abs(x), abs(y));
	}
	
	/// @desc Sets self with all components in absolute values
	static math_absv = function() {
		var value = math_abs();
		set(value);
		delete value;
		return self;
	}
	
	/// @param {Vector2} n
	/// @desc Returns a new Vector2 with all components powered values
	static math_power = function(n) {
		return new Vector2(power(x, n.x), power(y, n.y));
	}
	
	/// @param {Vector2} n
	/// @desc Returns a new Vector2 with all components powered values
	static math_powerv = function(n) {
		var value = math_power(n);
		set(value);
		delete value;
		return self;
	}
		
	/// @desc Returns a new Vector2 with all components in round values
	static math_round = function() {
		return new Vector2(round(x), round(y));
	}
	
	static math_floor = function() {
		return new Vector2(floor(x), floor(y));
	}
	
	static math_ceil = function() {
		return new Vector2(ceil(x), ceil(y));
	}
	
	/// @desc Returns real vector length
	static math_length = function() {
		return sqrt(x * x + y * y);
	}
	
	/// @param {Vector2} minVector2
	/// @desc Returns a new Vector2 with the minimum value of the Vector2s
	static math_min = function(minVector2) {
		return new Vector2(min(x, minVector2.x), min(y, minVector2.y));
	}
	
	/// @param minVector2 {Vector2}
	/// @desc Sets self with the minimum value of the Vector2s
	static math_minv = function(minVector2) {
		var value = math_min(minVector2);
		set(value);
		delete value;
		return self;
	}
	
	/// @param {Vector2} maxVector2
	/// @desc Returns a new Vector2 with the maximum value of the Vector2s
	static math_max = function(maxVector2) {
		return new Vector2(max(x, maxVector2.x), max(y, maxVector2.y));
	}
	
	/// @param {Vector2} maxVector2
	/// @desc Sets self with the maximum value of the Vector2s
	static math_maxv = function(maxVector2) {
		var value = math_max(maxVector2);
		set(value);
		delete value;
		return self;
	}
	
	/// @param {Vector2} minVector2
	/// @param {Vector2} maxVector2
	/// @desc Returns a new Vector2 with the clamped value of the Vector2s
	static math_clamp = function(minVector2, maxVector2) {
		var clamp_x = clamp(x, minVector2.x, maxVector2.x);
		var clamp_y = clamp(y, minVector2.y, maxVector2.y);
		return new Vector2(clamp_x, clamp_y);
	}
	
	/// @param {Vector2} minVector2
	/// @param {Vector2} maxVector2
	/// @desc Sets self with the clamped value of the Vector2s
	static math_clampv = function(minVector2, maxVector2) {
		var value = math_clamp(minVector2, maxVector2);
		set(value);
		delete value;
		return self;
	}
	
	/// @param {Vector2} targetVector2
	/// @param {Vector2} amountVector2
	/// @desc Returns a new Vector2 with the lerped value of the Vector2s
	static math_lerp = function(targetVector2, amountVector2) {
		var lerp_x = lerp(x, targetVector2.x, amountVector2.x);
		var lerp_y = lerp(y, targetVector2.y, amountVector2.y);
		return new Vector2(lerp_x, lerp_y);
	}
	
	/// @param {Vector2} targetVector2
	/// @param {Vector2} amountVector2
	/// @desc Sets self with the lerped value of the Vector2s
	static math_lerpv = function(targetVector2, amountVector2) {
		var value = math_lerpv(targetVector2, amountVector2);
		set(value);
		delete value;
		return self;
	}
	
	static copy = function() {
		return new Vector2(x, y);
	}
	
	/// @param {bool} mirror
	static to_list = function(mirror = false) {
		var list = ds_list_create();
		list[| 0] = mirror ? y : x; 
		list[| 1] = mirror ? x : y;
		return list;
	}
	
	/// @param {bool} mirror
	static to_array = function(mirror = false) {
		return mirror ? [y, x] : [x, y];
	}
	
	/// @param {string} delimiter
	static to_string = function(delimiter = ":") {
		return string(x) + delimiter + string(y);
	}
	
	/// @param {vector2_dir} direction
	/// @param {real} value
	/// @param {Vector2} Vector2
	static __dir_base = function(dir, value, vector) {
		switch (dir) {
			case vector2_dir.down:
				vector.y = -value;
				break;
			case vector2_dir.left:
				vector.y = -value;
				break;
			case vector2_dir.one:
				vector.x = value;
				vector.y = value;
				break;
			case vector2_dir.right:
				vector.x = value;
				break;
			case vector2_dir.up:
				vector.y = value;
				break;
			case vector2_dir.negone:
				vector.x = -value;
				vector.y = -value;
				break;
		}
	}
	
	/// @param {vector2_dir} direction
	/// @param {real} value
	static dir_set = function(dir, value) {
		__dir_base(dir, value, self);
		return self;
	}
	
	/// @param {vector2_dir} direction
	/// @param {real} value
	static dir_add = function(dir, value) {
		var vector = new Vector2();
		__dir_base(dir, value, vector);
		add(vector);
		delete vector;
		return self;
	}
	
	/// @param {vector2_dir} direction
	/// @param {real} value
	static dir_multi = function(dir, value) {
		var vector = copy();
		__dir_base(dir, value, vector);
		multi(vector);
		delete vector;
		return self;
	}
	
	#endregion
}

/// @param {Vector2} Vector2
/// @param {string} delemiter
function vector2_to_string(vector, delimiter = ":") {
	return vector.to_string(delimiter);
}
	
function display_get_gui_size() {
	return new Vector2(display_get_gui_width(), display_get_gui_height());
}

/// @param {Vector2} Vector2
function display_set_gui_vsize(_vector2) {
	display_set_gui_size(_vector2.x, _vector2.y)
}
	
/// @param {object} obj
function position_get(_object = id) {
	return new Vector2(_object.x, _object.y);
}

/// @param {Vector2} Vector2
/// @param {object} obj
function position_set(_vector2, _object = id) {
	_object.x = _vector2.x;
	_object.y = _vector2.y;
}
	
/// @param {Vector2} Vector2
/// @param {object} obj
function position_add(_vector2, _object = id) {
	_object.x += _vector2.x;
	_object.y += _vector2.y;
}
	
/// @param {Vector2} Vector2
/// @param {object} obj
function position_multi(_vector2, _object = id) {
	_object.x *= _vector2.x;
	_object.y *= _vector2.y;
}
	