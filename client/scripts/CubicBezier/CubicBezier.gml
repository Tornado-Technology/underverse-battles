/// @param {Struct.ClassVector2} point
function CubicBezier(point) constructor {
	self.point = point;
	p0 = new Vector2(0, 0);
	p1 = new Vector2(1, 1);
	
	/// @param {Real} t
	/// @return {Real}
	static get_point = function(t) {
		var l1 = p0.math_lerp(point, new Vector2(t, t));
		var l2 = point.math_lerp(p1, new Vector2(t, t));
		
		return l1.math_lerp(l2, new Vector2(t, t)).y;
	}
}
