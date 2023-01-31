/// @param {real} val1
/// @param {real} val2
/// @param {real} amout
/// @desc Approximates the value of val1 to val2 by amount 
function approach(val1, val2, amount) {
	return val1 < val2 ? min(val1 + amount, val2) : max(val1 - amount, val2);
}
