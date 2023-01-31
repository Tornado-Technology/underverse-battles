/// @param id
/// @param key
function soundtrack_get_value(_id, _key) {
	return soundtrack_get("id", _id)[$ _key];
}