/// @desc Сhecks if the key is a character. (constants are taken from the ASCII table)
/// @param {number} keyсode
function check_char(keycode) {
	return keycode >= 32 && keycode <= 255;
}