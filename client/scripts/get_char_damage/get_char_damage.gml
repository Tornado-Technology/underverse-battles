/// @function get_char_damage(char)
function get_char_damage(char_){
	if (!instance_exists(char_)) return 0;
	if (!variable_instance_exists(char_, "damage")) return 0;
	return char_.damage;
}
